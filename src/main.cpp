#include <restinio/all.hpp>
#include "luainterface.h"
#include <ncurses.h>
#include "gui.h"
#include "widgets.h"
#include "dashboard.h"

using std::vector;
using router_t = restinio::router::express_router_t<>;
using traits_t =
  restinio::traits_t<
    restinio::asio_timer_manager_t,
    restinio::null_logger_t,
    router_t>;

LuaInterface luaInterface;
Dashboard db;
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
  restinio::request_t *req = static_cast<restinio::request_t *>(lua_touserdata(L, -1));
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
      router->http_get(mapping.endpoint, [&](restinio::request_handle_t req, auto params) {
        RequestView rv;
        rv.endpoint = req->header().request_target(); 
        db.addIncomingRequest(rv);
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
        }
        return restinio::request_accepted();
      });
    }
  }
  return router;
}

void startServer(ServerConfig config, LuaMappings mappings)
{
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

void initGui(LuaMappings mappings)
{
  vector<RequestView> mappingsView;
  for (auto mapping: mappings.mappings) {
    RequestView rv;
    rv.endpoint = mapping.endpoint;
    rv.enabled = true;
    rv.method = mapping.method;
    rv.responseType = ACCEPT;
    mappingsView.push_back(rv);
  }
  db.setMappings(mappingsView, [&](RequestView ){});
  db.start();
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
  initGui(luaMappings);
  return 0;
}
