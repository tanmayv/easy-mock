#ifndef GUI_H_
#define GUI_H_
#include <iostream>
#include <utility>
#include <functional>
#include <vector>
#include <queue>
#include <ncurses.h>
#include <sys/select.h>
#include <unistd.h>
#include <time.h>
/* Init the GUi application and draw a widget tree?
 * Provide key access to currently focused widget
 * Handle global shortcuts?
 */
namespace GUI {
  using int_pair_t = std::pair<int, int>;
  using std::function;
  using std::vector;

  struct Renderer {
    void refresh(WINDOW *win);    
    WINDOW* newWindow(int_pair_t position, int_pair_t size);
    void clearWindow(WINDOW *win);
    void putStringAt(WINDOW *win, int_pair_t position, std::string label);
    void addBox(WINDOW *win, chtype type);
    void enableHighlight(WINDOW *win);
    void disableHighlight(WINDOW *win);
  };

  struct NodeOptions {
    int_pair_t padding{0, 0};  
    int_pair_t margin{0, 0};
    bool canBeFocused{false}; 
    int_pair_t size{0, 0};
    bool focus{false};
  };

  struct Node {
    NodeOptions options;
    int_pair_t position{0, 0};
    vector<Node*> children;
    void setFocus(bool focus);
    virtual void draw(Renderer *renderer);
    virtual void addChild(Node* child);
    virtual void removeChild(Node* child);
    virtual bool onKey(int key);
    virtual ~Node() = default;
    vector<function<bool(void)>> clickEventListener;
    vector<function<bool(void)>> focusEventListener;
    vector<function<bool(void)>> blurEventListener;
    vector<function<bool(char)>> keydownListener;
  };

  class NodeTreeManager {
    Renderer renderer;
    std::queue<Node*> focusList;
    Node* head;
    int polling_delay_us = 500000;
    public:
    int start();
    ~NodeTreeManager();
    void setTreeHead(Node* head);
    void nextFocus();
    void prevFocus();
    Node* getTreeHead();
    Node* getFocusedWiget();
    void draw();
  };

}
#endif
