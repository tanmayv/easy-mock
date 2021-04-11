#include <restinio/all.hpp>
extern "C" {
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}

using std::vector;
using router_t = restinio::router::express_router_t<>;
using traits_t =
  restinio::traits_t<
    restinio::asio_timer_manager_t,
    restinio::single_threaded_ostream_logger_t,
    router_t >;
lua_State *globalLuaState;

lua_State* requestLuaState() {
  return globalLuaState;
}

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
/* restinio::request_handling_status_t handler(restinio::request_handle_t req) */
/* { */
/*   if( restinio::http_method_get() == req->header().method() && */
/*       req->header().request_target() == "/" ) */
/*   { */
/*     req->create_response() */
/*       .append_header( restinio::http_field::server, "RESTinio hello world server" ) */
/*       .append_header_date_field() */
/*       .append_header( restinio::http_field::content_type, "text/plain; charset=utf-8" ) */
/*       .set_body( "Hello world!") */
/*       .done(); */
/*     return restinio::request_accepted(); */
/*   } */
/*   return restinio::request_rejected(); */
/* } */

void initLua() 
{
  globalLuaState = luaL_newstate();
  luaL_openlibs(globalLuaState);

  if (luaL_dofile(globalLuaState, "scripts/main.lua")) {
    std::cerr << "Something went wrong loading the chunk (syntax error?)" << std::endl;
    std::cerr << lua_tostring(globalLuaState, -1) << std::endl;
    lua_pop(globalLuaState,1);
  }
}


enum RequestMethod {
  GET, POST
};

struct Mapping {
  RequestMethod method;
  std::string endpoint;
  int handler;
};

struct LuaMappings {
  int callackKey;
  vector<Mapping> mappings;
};

struct ServerConfig {
  std::string hostname = "localhost"; 
  uint16_t port = 8080;
};

vector<std::string> split (std::string s, std::string delimiter) {
    size_t pos_start = 0, pos_end, delim_len = delimiter.length();
    std::string token;
    vector<std::string> res;

    while ((pos_end = s.find (delimiter, pos_start)) != std::string::npos) {
        token = s.substr (pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back (token);
    }

    res.push_back (s.substr (pos_start));
    return res;
}

void iterateTable(lua_State *L, int index, std::function<void(int,int)> keyFp) {
    lua_pushvalue(L, index);
    // stack now contains: -1 => table
    lua_pushnil(L);
    // stack now contains: -1 => nil; -2 => table
    while (lua_next(L, -2))
    {
        // stack now contains: -1 => value; -2 => key; -3 => table
        // copy the key so that lua_tostring does not modify the original
        lua_pushvalue(L, -2);
        // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
        keyFp(-1, -2);
        // pop value + copy of key, leaving original key
        lua_pop(L, 2);
        // stack now contains: -1 => key; -2 => table
    }
    // stack now contains: -1 => table (when lua_next returns 0 it pops the key
    // but does not push anything.)
    // Pop table
    lua_pop(L, 1);
    // Stack is now the same as it was on entry to this function
}

int storeLuaFunctionInTable(lua_State *L, int fnIndex, int tableIndex) {
  // push callback table on stack
  lua_rawgeti(L, LUA_REGISTRYINDEX, tableIndex);
  // copy function to top of the stack
  lua_pushvalue(L, fnIndex - 1);
  // add ref of function to callback table
  int fnIndexInTable = luaL_ref(L, -2);
  lua_pop(L, 1);
  return fnIndexInTable;
}

void loadMappingsFromLua(lua_State *L,int index, LuaMappings &luaMappings) {
  iterateTable(L, index, 
      [&](int, int valueIndex) -> void{
        if (!lua_istable(L, valueIndex))
        {
          std::cout << "Not a valid table to iterate";
          return;
        }
        Mapping m;
        iterateTable(L, valueIndex, [&](int keyIndex, int valueIndex) -> void{
            std::string key = lua_tostring(L, keyIndex);
            if (key == "method" && lua_isnumber(L, valueIndex)) {
              m.method = RequestMethod(lua_tonumber(L, valueIndex)); 
            }
            if (key == "endpoint" && lua_isstring(L, valueIndex)) {
              m.endpoint = lua_tostring(L, valueIndex); 
            }
            if (key == "handler" && lua_isfunction(L, valueIndex)) {
              m.handler = storeLuaFunctionInTable(L, valueIndex, luaMappings.callackKey);
              std::cout <<"Handler added: " << m.handler;
            }
        }); 
        std::cout <<"New mapping added: " << m.endpoint;
        luaMappings.mappings.push_back(m);
      });
    std::cout <<"Finished adding mappings";
}

// Pop the function from stack after calling the fn
//  loading in this method
void loadCallbackFnFromLua(lua_State *L, int fnIndex, int tableIndex) {
  std::cout << "Callback key: " << tableIndex << std::endl; 
  std::cout << "Function key: " << fnIndex << std::endl; 
  
  // get the table on top
  lua_rawgeti(L, LUA_REGISTRYINDEX, tableIndex);
  if (lua_istable(L, -1)) {
    std::cout << "table is correct" << std::endl;
  }
  // get the fn from the table
  lua_rawgeti(L, -1, fnIndex);
  if (lua_isfunction(L, -1)) {
    std::cout << "Function is correct" << std::endl;
  }
  if (lua_isstring(L, -1)) {
    std::cout << lua_tostring(L, -1) << std::endl;
  }
  std::cout << "Loading is done" << std::endl;
}

void pushParamsToLuaTable(lua_State *L, std::string endpoint, restinio::router::route_params_t &params) {
  vector<std::string> paramKeys = split(endpoint, "/:");  
  lua_newtable(L);
  for (auto paramKey: paramKeys) {
    if (params.has(paramKey)) {
      const std::string value = restinio::cast_to<std::string>(params[paramKey]);
      std::cout << "Pushing params " << paramKey << ":" << value << std::endl;
      lua_pushstring(L, paramKey.data()); // set key
      lua_pushstring(L, value.data());    // set value  
      lua_settable(L, -3);                // set key, value in table
    }
  }
}

auto createRouterFromMappings(LuaMappings luaMappings)
{
  auto router = std::make_unique< router_t >();
  for(auto& mapping: luaMappings.mappings) {
    if (mapping.method == GET) {
      router->http_get(mapping.endpoint, [&]( auto req, auto params) {
        lua_State* L = requestLuaState();
        loadCallbackFnFromLua(L, mapping.handler, luaMappings.callackKey);
        pushParamsToLuaTable(L, mapping.endpoint, params);
        lua_pcall(L, 1, 1, 0);
        std::string body = lua_tostring(L, -1);
        lua_pop(L, 1);

        req->create_response()
          .set_body(body)
          .done();
        return restinio::request_accepted();
      });
    }
  }
  return router;
}

void loadConfigFromLua(lua_State *L, int index, ServerConfig &config) {
  iterateTable(L, index, [&](int keyIndex, int valueIndex) -> void{
          std::string key = lua_tostring(L, keyIndex);
          if (key == "port" && lua_isnumber(L, valueIndex)) {
            config.port = static_cast<uint16_t>(lua_tonumber(L, valueIndex));
          }
          if (key == "hostname" && lua_isstring(L, valueIndex)) {
            config.hostname = lua_tostring(L, valueIndex);
          }
      });  
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
  lua_State *L = requestLuaState();
  lua_newtable(L);
  int tabKey = luaL_ref(L, LUA_REGISTRYINDEX);
  luaMapping.callackKey = tabKey;
  std::cout << tabKey << " is the callback key." << std::endl;
}

int main() {
  LuaMappings luaMappings;
  ServerConfig config;
  initLua();

  createCallbackRegistryTable(luaMappings);
  lua_getglobal(globalLuaState, "mappings");
  bool haveMappings = lua_istable(globalLuaState, -1);
  if (!haveMappings) {
    std::cout << "No mapping found!";
    return 1;
  }
  loadMappingsFromLua(globalLuaState, -1, luaMappings);
  lua_getglobal(globalLuaState, "serverConfig");
  bool haveConfig = lua_istable(globalLuaState, -1);
  if (!haveConfig) {
    std::cout << "No config found!";
    return 1;
  }
  loadConfigFromLua(globalLuaState, -1, config);
  startServer(config, luaMappings);
  return 0;
}
