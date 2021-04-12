#ifndef DASHBOARD_H_
#define DASHBOARD_H_
#include "widgets.h"
#include "common.h"

enum ResponseType {
  ACCEPT, REJECT, REDIRECT, ACCESS_DENIED 
}

struct RequestView {
  RequestMethod method;
  std::string endpoint;
  ResponseType responseType;
  bool enabled = true;
}

struct ServerInformation {
  std::string hostname;
  uint16_t port;
}

class Dashboard {
public:
  void setMappings(std::vector<RequestView> mappings, function<void(RequestView)> onClick);
  void addIncomingRequest(RequestView request);
}

#endif
