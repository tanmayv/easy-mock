#include <restinio/all.hpp>
extern "C" {
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}
#include "luainterface.h"

using std::vector;
using router_t = restinio::router::express_router_t<>;
using traits_t =
  restinio::traits_t<
    restinio::asio_timer_manager_t,
    restinio::single_threaded_ostream_logger_t,
    router_t >;

LuaInterface luaInterface;

bool CheckLua(lua_State *L, int r)
{
	if (r != LUA_OK)
	{
		std::string errormsg = lua_tostring(L, -1);
		std::cout << errormsg << std::endl;
		return false;
	}
	return true;
}

static int CreateSuccessResponse(lua_State* L) {
  // restinio::request_t -> request_t::response_builder_t
  restinio::request_t *req = static_cast<restinio::request_t*>(lua_touserdata(L, -1));
  req->create_response().set_body("Lua is handling it").done();
  return 0;
}

void initLua() 
{
  luaL_openlibs(luaInterface.getState());

  if (luaL_dofile(luaInterface.getState(), "scripts/main.lua")) {
    std::cerr << "Something went wrong loading the chunk (syntax error?)" << std::endl;
    std::cerr << lua_tostring(luaInterface.getState(), -1) << std::endl;
    lua_pop(luaInterface.getState(),1);
  }
  lua_register(luaInterface.getState(), "_CreateSuccessResponse", CreateSuccessResponse);
}


auto createRouterFromMappings(LuaMappings luaMappings)
{
  auto router = std::make_unique< router_t >();
  for(auto& mapping: luaMappings.mappings) {
    if (mapping.method == GET) {
      router->http_get(mapping.endpoint, [&](auto req, auto params) {
        luaInterface.loadCallbackFnFromLua(mapping.handler, luaMappings.callackKey);
        luaInterface.pushParamsToLuaTable(mapping.endpoint, req.get(), params);
        lua_pcall(luaInterface.getState(), 1, 0, 0);
/*         req->create_response() */
/*           .set_body(body) */
/*           .done(); */
        return restinio::request_accepted();
      });
    }
  }
  return router;
}

void startServer(ServerConfig config, LuaMappings mappings) {
  std::cout << "Server started at " << config.hostname << config.port;  
  restinio::run(
    restinio::on_this_thread<traits_t>()
      .port(config.port)
      .address(config.hostname)
      .request_handler(createRouterFromMappings(mappings)));
}

void createCallbackRegistryTable(LuaMappings &luaMapping) {
  lua_State *L = luaInterface.getState();
  lua_newtable(L);
  int tabKey = luaL_ref(L, LUA_REGISTRYINDEX);
  luaMapping.callackKey = tabKey;
}

int main() {
  LuaMappings luaMappings;
  ServerConfig config;
  initLua();

  createCallbackRegistryTable(luaMappings);
  lua_getglobal(luaInterface.getState(), "mappings");
  bool haveMappings = lua_istable(luaInterface.getState(), -1);
  if (!haveMappings) {
    std::cout << "No mapping found!";
    return 1;
  }
  luaInterface.loadMappingsFromLua(-1, luaMappings);
  lua_getglobal(luaInterface.getState(), "serverConfig");
  bool haveConfig = lua_istable(luaInterface.getState(), -1);
  if (!haveConfig) {
    std::cout << "No config found!";
    return 1;
  }
  luaInterface.loadConfigFromLua(-1, config);
  startServer(config, luaMappings);
  return 0;
}
