#pragma once
#ifndef LUA_INTERFACE_H_
#define LUA_INTERFACE_H_
#include <iostream>
#include "common.h"
#include <restinio/all.hpp>
extern "C" {
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}

using std::map;
using std::string;

class LuaInterface {
  public:
    lua_State* getState();
    
    void iterateTable(int index, std::function<void(int,int)> keyFp);

    int storeLuaFunctionInTable(int fnIndex, int tableIndex); 

    void loadConfigFromLua(int index, ServerConfig &config); 

    void loadMappingsFromLua(int index, LuaMappings &luaMappings); 
    // Pop the function from stack after calling the fn
    //  loading in this method
    void loadCallbackFnFromLua(int fnIndex, int tableIndex); 

    void pushStringKeyValueToTable(int tableIndex, string key, string value);

    void pushPointerToTable(int tableIndex, string key, void *ptr);
    LuaInterface() {
      L = luaL_newstate();
    };

  protected:
    lua_State *L;
};

#endif
