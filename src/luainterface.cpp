#include "luainterface.h"
using std::vector;

lua_State* LuaInterface::getState() {return L;}

std::vector<std::string> split (std::string s, std::string delimiter) {
    size_t pos_start = 0, pos_end, delim_len = delimiter.length();
    std::string token;
    std::vector<std::string> res;

    while ((pos_end = s.find (delimiter, pos_start)) != std::string::npos) {
        token = s.substr (pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back (token);
    }

    res.push_back (s.substr (pos_start));
    return res;
}
void LuaInterface::iterateTable(int index, std::function<void(int,int)> keyFp) {
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

int LuaInterface::storeLuaFunctionInTable(int fnIndex, int tableIndex) {
  // push callback table on stack
  lua_rawgeti(L, LUA_REGISTRYINDEX, tableIndex);
  // copy function to top of the stack
  lua_pushvalue(L, fnIndex - 1);
  // add ref of function to callback table
  int fnIndexInTable = luaL_ref(L, -2);
  lua_pop(L, 1);
  return fnIndexInTable;
}

void LuaInterface::loadConfigFromLua(int index, ServerConfig &config) {
  iterateTable(index, [&](int keyIndex, int valueIndex) -> void{
      std::string key = lua_tostring(L, keyIndex);
      if (key == "port" && lua_isnumber(L, valueIndex)) {
      config.port = static_cast<uint16_t>(lua_tonumber(L, valueIndex));
      }
      if (key == "hostname" && lua_isstring(L, valueIndex)) {
      config.hostname = lua_tostring(L, valueIndex);
      }
      });  
}

void LuaInterface::loadMappingsFromLua(int index, LuaMappings &luaMappings) {
  iterateTable(index, 
      [&](int, int valueIndex) -> void{
      if (!lua_istable(L, valueIndex))
      {
      std::cout << "Not a valid table to iterate";
      return;
      }
      Mapping m;
      iterateTable(valueIndex, [&](int keyIndex, int valueIndex) -> void{
          std::string key = lua_tostring(L, keyIndex);
          if (key == "method" && lua_isnumber(L, valueIndex)) {
          m.method = RequestMethod(lua_tonumber(L, valueIndex)); 
          }
          if (key == "endpoint" && lua_isstring(L, valueIndex)) {
          m.endpoint = lua_tostring(L, valueIndex); 
          }
          if (key == "handler" && lua_isfunction(L, valueIndex)) {
          m.handler = storeLuaFunctionInTable(valueIndex, luaMappings.callackKey);
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
void LuaInterface::loadCallbackFnFromLua(int fnIndex, int tableIndex) {
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

void LuaInterface::pushParamsToLuaTable(std::string endpoint, restinio::request_t *req, restinio::router::route_params_t &params) {
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
  lua_pushstring(L, "request");
  lua_pushlightuserdata(L, req);
  lua_settable(L, -3);
}
