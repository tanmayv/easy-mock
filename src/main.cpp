#include <restinio/all.hpp>
#include <ncurses.h>
#include <sol/sol.hpp>
#include "gui.h"
#include "widgets.h"
#include "dashboard.h"

using std::vector;
using std::cout;
using std::endl;
using router_t = restinio::router::express_router_t<>;
using traits_t =
  restinio::traits_t<
    restinio::asio_timer_manager_t,
    restinio::null_logger_t,
    router_t>;

int luaNodeCallbackTable = 0;
GUI::NodeTreeManager ntm;
sol::state lua;

static int CreateSuccessResponse(restinio:: request_t *req)
{
  req->create_response().set_body("Lua is handling it").done();
  return 0;
}

GUI::Node* getNodeFromLuaTable(sol::table);

int DrawTree(sol::table uiTree) {

  GUI::Node* tree = getNodeFromLuaTable(uiTree); 
  cout << "Got tree " << tree << endl;
  ntm.setTreeHead(tree);   
  return 0;
}

void initLua()
{
  lua.open_libraries(sol::lib::base);
  lua.script_file("scripts/main.lua", [&](lua_State*, sol::protected_function_result pfr) {
    return pfr;
  });

  lua["_CreateSuccessResponse"] = &CreateSuccessResponse;
  lua["_DrawTree"] = &DrawTree;
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

auto createRouterFromMappings()
{
  auto router = std::make_unique<router_t>();
  for (const auto &it : lua["mappings"].get_or_create<sol::table>()) {
    sol::table mapping = it.second;
    if (mapping["method"] == GET) {
      cout << "Mapping added " << mapping.get<std::string>("endpoint") << endl;
      router->http_get(mapping.get<std::string>("endpoint"), [mapping](restinio::request_handle_t req, auto params) {
        RequestView rv;
        cout << "handling Mapping " << mapping.get<std::string>("endpoint") << endl;
        rv.endpoint = req->header().request_target(); 
        /* db.addIncomingRequest(rv); */
        vector<std::string> paramKeys = split(mapping["endpoint"], "/:");
        vector<std::string> paramTable = split(mapping["endpoint"], "/:");
        /* luaInterface.loadCallbackFnFromLua(mapping.handler, luaMappings.callackKey); */
        /* lua_newtable(luaInterface.getState()); */
        /* luaInterface.pushPointerToTable(-1, "request", req.get()); */
        for (auto paramKey : paramKeys) {
          if (params.has(paramKey)) {
            paramTable.push_back(paramKey);
            paramTable.push_back(static_cast<std::string>(params[paramKey]));
          }
        }
        mapping["handler"](req.get(), paramKeys);
        return restinio::request_accepted();
      });
    }
  }
  return router;
}

void startServer()
{
  uint16_t port = lua["serverConfig"]["port"];
  std::string hostname = lua["serverConfig"]["hostname"];
  restinio::run(
    restinio::on_this_thread<traits_t>()
      .port(port)
      .address(hostname)
      .request_handler(createRouterFromMappings()));
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
  /* db.setMappings(mappingsView, [&](RequestView ){}); */
  /* db.start(); */
}

GUI::Node* getNodeFromLuaTable(sol::table tree) {
  
  GUI::LUA_NODE nodeType = GUI::LUA_NODE(tree["nodeType"]);
  cout << "Read node type" << nodeType <<endl;

  switch (nodeType) {
    case (GUI::LUA_VERTIAL_NODE): {
      GUI::VerticalContainer* vn = new GUI::VerticalContainer();
      sol::table children = tree["children"].get_or_create<sol::table>();
      for (const auto& key_value_pair: children ) {
        if (auto node = getNodeFromLuaTable(key_value_pair.second)) {
          vn->addChild(node);
        }
      }
      return vn;
    }

    case (GUI::LUA_BUTTON_NODE): {
      std::string label = tree["label"];
      GUI::Button* bn = new GUI::Button(label);

        bn->clickEventListener.push_back([](){
          mvprintw(10, 1, "calling cb");
          refresh();
          lua["cb"]();
          return true;
        });
      return bn;
    }

    case (GUI::LUA_LABEL_NODE): {
      std::string label = tree["label"];
      GUI::Label* ln = new GUI::Label(label);

      return ln;
    }
  }

  return nullptr;
}

int main()
{
  LuaMappings luaMappings;
  ServerConfig config;
  initLua();
  /* std::thread t(startServer); */
  lua["main"]();
  int i = 0;
  ntm.start();

  /* t.join(); */
  return 0;
}
