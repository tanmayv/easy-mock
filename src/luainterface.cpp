#include "luainterface.h"
using std::vector;

lua_State* LuaInterface::getState() {return L;}

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
          }
          }); 
      luaMappings.mappings.push_back(m);
      });
}

// Pop the function from stack after calling the fn
//  loading in this method
void LuaInterface::loadCallbackFnFromLua(int fnIndex, int tableIndex) {
  // get the table on top
  lua_rawgeti(L, LUA_REGISTRYINDEX, tableIndex); // -2
  // get the fn from the table
  lua_rawgeti(L, -1, fnIndex); // -1
  lua_remove(L, -2);
}

void LuaInterface::pushPointerToTable(int tableIndex, string key, void *ptr) {
  lua_pushvalue(L, tableIndex);
  lua_pushstring(L, key.data());
  lua_pushlightuserdata(L, ptr);
  lua_settable(L, -3);
  lua_pop(L, 1);
}

void LuaInterface::pushStringKeyValueToTable(int tableIndex, string key, string value) {
  lua_pushvalue(L, tableIndex);
  lua_pushstring(L, key.data());
  lua_pushstring(L, value.data());
  lua_settable(L, -3);
  lua_pop(L, 1);
}
