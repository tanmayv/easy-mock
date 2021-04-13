#include "dashboard.h"

Dashboard::Dashboard() {
    mappingsContainer = new GUI::ScrollingContainer("Mappings", {50,9});
    requestContainer = new GUI::ScrollingContainer("Incoming Requests", {50,9});
}
void Dashboard::setMappings(vector<RequestView> m, function<void(RequestView)> cb) {
  mappings.clear();
  mappings = m;
  if (!mappingsContainer) {
    mappingsContainer = new GUI::ScrollingContainer("Mappings", {20,5});
  }
  int i = 0;
  for (auto mapping: mappings) {
    std::string entry = mapping.endpoint;
    mappingsContainer->addField(entry, i++);
  }
}

void Dashboard::addIncomingRequest(RequestView request) {
  requests.push_back(request);
  requestContainer->addField(request.endpoint, 0);
}

void Dashboard::start() {
    vector<std::string> header = {
    " ______                  __  __            _  ",
    "|  ____|                |  \\/  |          | |",
    "| |__   __ _ ___ _   _  | \\  / | ___   ___| | __ ",
    "|  __| / _` / __| | | | | |\\/| |/ _ \\ / __| |/ /",
    "| |___| (_| \\__ \\ |_| | | |  | | (_) | (__|   < ",
    "|______\\__,_|___/\\__, | |_|  |_|\\___/ \\___|_|\\_\\",
    "                  __/ |                               ",
    "                 |___/                                "
  };

  GUI::Node* div = dynamic_cast<GUI::Node*>(new GUI::VerticalContainer());
  GUI::Node* hori = dynamic_cast<GUI::Node*>(new GUI::HorizontalContainer());
  GUI::Node* button = dynamic_cast<GUI::Node*>(new GUI::Button("exit"));
  button->clickEventListener.push_back([&](){
      endwin();
    exit(0); 
    return true; 
  });
  for (auto h: header) {    
    div->addChild(dynamic_cast<GUI::Node*>(new GUI::Label(h)));
  }
  div->addChild(button);
  hori->addChild(mappingsContainer);
  hori->addChild(requestContainer);
  div->addChild(hori);
  ntm.setTreeHead(div);
  ntm.start();
  delete div;
  delete button;
  delete mappingsContainer;
}
