#ifndef WIDGETS_H_
#define WIDGETS_H_
#include "gui.h"

namespace GUI {
  class VerticalContainer: public Node {
    void draw(Renderer* r) override;
  };
  
  class HorizontalContainer: public Node {
    void draw(Renderer* r) override;
  };

  class Label: public Node {
  protected:
    WINDOW* win;
    std::string label;
  public:
    void draw(Renderer* r) override;
    void addChild(Node* r) override;
    void cleanup() override;
    Label(std::string);
  };

  class Button: public Node {
  protected:
    WINDOW* win;
    std::string label;
  public:
    Button(std::string);
    void addChild(Node* r) override;
    void cleanup() override;
    void draw(Renderer* r) override;
    bool onKey(int key) override;
  };

  class ScrollingContainer: public Node {
  protected:
    WINDOW* win;
    std::string label;
    int current = 0;
    int startIndex = 0;
    function<void(int, std::string)> selectCb;
  public:
    vector<std::string> content;
    ScrollingContainer(std::string, int_pair_t size);
    ScrollingContainer(std::string, vector<std::string> c, int_pair_t size);
    void onSelect(function<void(int, std::string)>);
    void addField(std::string entry, int index);
    void cleanup() override;
    bool onKey(int key) override;
    void draw(Renderer* r) override;
  };
}

#endif
