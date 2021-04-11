#ifndef COMMON_H_
#define COMMON_H_
#include <iostream>
#include <vector>
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
  std::vector<Mapping> mappings;
};

struct ServerConfig {
  std::string hostname = "localhost"; 
  uint16_t port = 8080;
};

#endif
