#ifndef DASHBOARD_H_
#define DASHBOARD_H_
#include "widgets.h"
#include "common.h"
#include <functional>

using std::vector;
using std::function;
enum ResponseType {
  ACCEPT, REJECT, REDIRECT, ACCESS_DENIED 
};

struct RequestView {
  RequestMethod method;
  std::string endpoint;
  ResponseType responseType;
  bool enabled = true;
};

struct ServerInformation {
  std::string hostname;
  uint16_t port;
};

class Dashboard {
  vector<RequestView> mappings;
  vector<RequestView> requests;
  GUI::ScrollingContainer *mappingsContainer;
  GUI::ScrollingContainer *requestContainer;
  GUI::NodeTreeManager ntm;
public: 
  Dashboard();
  void setMappings(std::vector<RequestView> mappings, std::function<void(RequestView)> onClick);
  void addIncomingRequest(RequestView request);
  void start();
};

#endif
