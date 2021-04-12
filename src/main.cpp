#include <restinio/all.hpp>
#include "luainterface.h"
#include <ncurses.h>
#include "gui.h"
#include "widgets.h"

using std::vector;
using router_t = restinio::router::express_router_t<>;
using traits_t =
  restinio::traits_t<
    restinio::asio_timer_manager_t,
    restinio::shared_ostream_logger_t,
    router_t>;

LuaInterface luaInterface;
GUI::NodeTreeManager ntm;

bool CheckLua(lua_State *L, int r)
{
  if (r != LUA_OK) {
    std::string errormsg = lua_tostring(L, -1);
    return false;
  }
  return true;
}

static int CreateSuccessResponse(lua_State *L)
{
  std::cout << "Got the call from lua" << std::endl;
  restinio::request_t *req = static_cast<restinio::request_t *>(lua_touserdata(L, -1));
  std::cout << req << std::endl;
  req->create_response().set_body("Lua is handling it").done();
  return 0;
}

void initLua()
{
  luaL_openlibs(luaInterface.getState());

  if (luaL_dofile(luaInterface.getState(), "scripts/main.lua")) {
    std::cerr << "Something went wrong loading the chunk (syntax error?)" << std::endl;
    std::cerr << lua_tostring(luaInterface.getState(), -1) << std::endl;
    lua_pop(luaInterface.getState(), 1);
  }
  lua_register(luaInterface.getState(), "_CreateSuccessResponse", CreateSuccessResponse);
}

std::vector<std::string> split(std::string s, std::string delimiter)
{
  size_t pos_start = 0, pos_end, delim_len = delimiter.length();
  std::string token;
  std::vector<std::string> res;

  while ((pos_end = s.find(delimiter, pos_start)) != std::string::npos) {
    token = s.substr(pos_start, pos_end - pos_start);
    pos_start = pos_end + delim_len;
    res.push_back(token);
  }

  res.push_back(s.substr(pos_start));
  return res;
}

auto createRouterFromMappings(LuaMappings luaMappings)
{
  auto router = std::make_unique<router_t>();
  for (auto &mapping : luaMappings.mappings) {
    if (mapping.method == GET) {
      router->http_get(mapping.endpoint, [&](auto req, auto params) {
        std::cout << mapping.endpoint << " received" << std::endl;
        vector<std::string> paramKeys = split(mapping.endpoint, "/:");
        luaInterface.loadCallbackFnFromLua(mapping.handler, luaMappings.callackKey);
        lua_newtable(luaInterface.getState());
        luaInterface.pushPointerToTable(-1, "request", req.get());
        for (auto paramKey : paramKeys) {
          if (params.has(paramKey)) {
            luaInterface.pushStringKeyValueToTable(-1, paramKey, static_cast<string>(params[paramKey]));
          }
        }
        if (lua_pcall(luaInterface.getState(), 1, 0, 0) != 0) {
          std::cout << lua_tostring(luaInterface.getState(), -1) << std::endl;
        }
        return restinio::request_accepted();
      });
    }
  }
  return router;
}

void startServer(ServerConfig config, LuaMappings mappings)
{
  std::cout << "Server" << config.hostname << std::endl;
  restinio::run(
    restinio::on_this_thread<traits_t>()
      .port(config.port)
      .address(config.hostname)
      .request_handler(createRouterFromMappings(mappings)));
}

void createCallbackRegistryTable(LuaMappings &luaMapping)
{
  lua_State *L = luaInterface.getState();
  lua_newtable(L);
  int tabKey = luaL_ref(L, LUA_REGISTRYINDEX);
  luaMapping.callackKey = tabKey;
}

void initGui()
{
  GUI::Node* div = dynamic_cast<GUI::Node*>(new GUI::VerticalContainer());
  GUI::Node* label = dynamic_cast<GUI::Node*>(new GUI::Label("This is a label"));
  GUI::Node* button = dynamic_cast<GUI::Node*>(new GUI::Button("exit"));
  GUI::Node* stringList = dynamic_cast<GUI::Node*>(new GUI::ScrollingContainer("String List", {"One", "Two", "Three", "Four"}, {30, 10}));

  button->clickEventListener.push_back([&](){
      endwin();
    exit(0); 
    return true; 
  });
  div->addChild(label);
  div->addChild(button);
  div->addChild(stringList);
  ntm.setTreeHead(div);
  ntm.start();
}

int main()
{
  LuaMappings luaMappings;
  ServerConfig config;
  initLua();

  createCallbackRegistryTable(luaMappings);
  lua_getglobal(luaInterface.getState(), "mappings");
  bool haveMappings = lua_istable(luaInterface.getState(), -1);
  if (!haveMappings) {
    return 1;
  }
  luaInterface.loadMappingsFromLua(-1, luaMappings);
  lua_getglobal(luaInterface.getState(), "serverConfig");
  bool haveConfig = lua_istable(luaInterface.getState(), -1);
  if (!haveConfig) {
    return 1;
  }
  luaInterface.loadConfigFromLua(-1, config);
  std::thread t(startServer, config, luaMappings);
  std::cout << luaMappings.mappings.size() << std::endl;
  initGui();
  return 0;
}
