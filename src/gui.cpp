#include "gui.h"

namespace GUI {
  void traverseNodeTree(Node *h, function<void(Node*)> cb) {
    cb(h);
    for (auto node: h->children) {
      traverseNodeTree(node, cb);
    } 
  }

  void Node::draw(Renderer *r) {
    for (auto n: children) n->draw(r);
  }

  void Node::cleanup() {
    for (auto n: children) {
      n->cleanup();
      delete n;
    } 
  }

  void Node::addChild(Node *c) {
    children.push_back(c); 
  }

  void Node::removeChild(Node *r) {
    std::remove(children.begin(), children.end(), r);
  }

  bool Node::onKey(int) {
    return false;
  }

  void Node::setFocus(bool focus) {
    options.focus = focus;
    auto cbList = focus ? focusEventListener : blurEventListener;
    for (auto cb: cbList) {
      if(cb()) return;
    }
  }

  void NodeTreeManager::setTreeHead(Node* h) {
    if (head) {
      head->cleanup();
      delete head;
    }
    head = h;
    focusList = {};
    focusList.push(nullptr);
    traverseNodeTree(head, [&](Node* child) {
          if (child->options.canBeFocused) focusList.push(child);
        });
  };

  void NodeTreeManager::nextFocus() {
    focusList.push(focusList.front());
    focusList.pop();
    if (auto w = focusList.front()) w->setFocus(true);
    if (auto w = focusList.back()) w->setFocus(false);
  } 

  void NodeTreeManager::prevFocus() {
    auto end = focusList.back(); // end = 2
    auto curr = focusList.front();
    while (focusList.front() != end)
    { 
      focusList.push(focusList.front());
      focusList.pop();
    }
    if (auto w = focusList.front()) w->setFocus(true);
    if (curr) curr->setFocus(false);
  }


  Node* NodeTreeManager::getTreeHead() { return head;}

  Node* NodeTreeManager::getFocusedWiget() {
    return focusList.front();
  };

  NodeTreeManager::~NodeTreeManager() {
    endwin();
  }

  void NodeTreeManager::draw() { 
    head->draw(&renderer);
  }

  int NodeTreeManager::start() {
    initscr();
    noecho();
    keypad(stdscr, true);
    cbreak();
    int input = 0; 
    while (input != 'q') {
      fd_set fds;
      FD_ZERO(&fds);
      FD_SET(STDIN_FILENO, &fds);

      timeval tv;
      tv.tv_sec = 0;
      tv.tv_usec = polling_delay_us;
      draw();
      int status = select(STDIN_FILENO + 1, &fds, NULL, NULL, &tv);
      if (status == -1) {
        if (errno != EINTR) {
          return EXIT_FAILURE;
        }
      }
      else if ( FD_ISSET(STDIN_FILENO, &fds) ) {

        /*  Only call getch() if input is ready.
         *  getch() will not block when we do it this way.  */
        int currentKey;
        if ( (currentKey = getch()) == ERR ) {
          return EXIT_FAILURE;
        }
        
        switch(currentKey) {
          // TAB
          case(9):
            nextFocus();
            break;
          // S-Tab
          case(353): 
            prevFocus();
          default:
            if (focusList.front()) {
              if (!focusList.front()->onKey(currentKey)) { input = currentKey; }
            }

        }
      }
    }
    return 0;
  }

  void Renderer::refresh(WINDOW *win) {
    wrefresh(win ? win: stdscr);
  }

  WINDOW* Renderer::newWindow(int_pair_t position, int_pair_t size) {
    return newwin(size.second, size.first, position.second, position.first);
  }

  void Renderer::clearWindow(WINDOW *win) {
    wclear(win ? win: stdscr);
  }

  void Renderer::putStringAt(WINDOW *win, int_pair_t position, std::string label) {
    mvwaddstr(win, position.second, position.first, label.data());
  }

  void Renderer::addBox(WINDOW *win, chtype type) {
    box(win, type, type);
  }

  void Renderer::enableHighlight(WINDOW *win) {
    wattron(win, A_REVERSE);
  }

  void Renderer::disableHighlight(WINDOW *win) {
    wattroff(win, A_REVERSE);
  }
}

/* #include <functional> */
/* #include <iostream> */
/* #include <utility> */
/* #include <vector> */
/* #include <queue> */
/* #include <ncurses.h> */
/* #include <ostream> */

/* #define PRIMARY 1 */
/* #define SECONDARY 2 */
/* class Renderer { */
/*   public: */
/*     static WINDOW* NewWindow(int x, int y, int width, int height, bool addBox = true) { */
/*       WINDOW* win = newwin(height, width, y, x); */ 
/*       if (addBox) { */
/*         box(win, 0, 0); */
/*       } */
/*       wrefresh(win); */
/*       return win; */
/*     } */
/*     static void SetColor(WINDOW* win, int colorPair) { */
/*       wattron(win, COLOR_PAIR(colorPair)); */
/*       wbkgd(win, COLOR_PAIR(colorPair)); */
/*       wattroff(win, COLOR_PAIR(colorPair)); */
/*       wrefresh(win); */
/*     } */
/*     static void PrintStringAt(WINDOW* win, int x, int y, std::string string) { */
/*       mvwaddstr(win, y, x, string.c_str()); */
/*       wrefresh(win); */
/*     } */
/* }; */

/*   template <class T> */
/* inline void hash_combine(std::size_t& seed, const T& v) */
/* { */
/*   std::hash<T> hasher; */
/*   seed ^= hasher(v) + 0x9e3779b9 + (seed<<6) + (seed>>2); */
/* } */

/* class Widget { */
/*   public: */ 
/*     Widget *parent = nullptr; */
/*     std::vector<Widget*> children; */
/*     int getSizeX() { return sizeX; } */
/*     int getSizeY() { return sizeY; } */
/*     int getX() { return x; } */
/*     int getY() { return y; } */
/*     std::string getTag() { return tag; } */
/*     bool getFocusable() { return focusable; } */
/*     void setFocus(bool f) { */
/*       focus = f; */
/*       paint(); */
/*     } */
/*     bool getFocus() { return focus; } */
/*     virtual int luaEvent() { */
/*       return 0; */
/*     } */
/*     void addChild(Widget *child) { */
/*       if (child != nullptr) { */
/*         children.push_back(child); */
/*         child->parent = this; */
/*       } */
/*     } */
/*     virtual size_t hash() = 0; */
/*     virtual void update() { */
/*       for (auto& child: children) { */
/*         child->update(); */
/*       } */
/*     }; */
/*     virtual void paint() = 0; */ 
/*     virtual ~Widget() = default; */
/*     virtual void destroy() { */
/*       for (auto& child: children) { */
/*         child->destroy(); */
/*       } */
/*       delete this; */
/*     } */
/*     void setX(int xValue) { x = xValue; } */
/*     void setY(int yValue) { y = yValue; } */
/*   protected: */
/*     std::string tag; */
/*     bool focusable = false; */
/*     bool focus = false; */
/*     int x = 0; */
/*     int y = 0; */
/*     int sizeX = 0; */
/*     int sizeY = 0; */
/* }; */

/* class Frame: public Widget { */
/*   public: */ 
/*   Frame() { tag = "root";} */
/*   size_t hash() override { */
/*     return 0; */
/*   } */  
  
/*   void paint() override { */
/*     int offsetY = y; */
/*     for (auto& child: children) { */
/*       child->setX(x); */
/*       child->setY(offsetY); */
/*       child->paint(); */
/*       offsetY += child->getSizeY(); */
/*       sizeY += child->getSizeY(); */
/*       sizeX = std::max(sizeX, child->getSizeX()); */
/*     } */
/*   } */
/* }; */

/* class Label: public Widget { */
/* public: */
/*   Label(std::string str):label(str) { */
/*     tag = str; */
/*   } */
/*   WINDOW *win = nullptr; */

/*   size_t hash() override { */
/*     size_t h = 0; */
/*     hash_combine(h, label); */
/*     return h; */
/*   } */
/*   void paint() override { */
/*     sizeX = static_cast<int>(label.size()); */
/*     sizeY = 1; */
/*     if (win == nullptr) { */
/*       win = Renderer::NewWindow(x, y, sizeX, sizeY, false); */
/*     } */
/*     Renderer::PrintStringAt(win, 0, 0, label); */
/*   } */

/*   void destroy() override { */
/*     delwin(win); */
/*   } */
/* protected: */
/*   std::string label; */
/* }; */

/* class Button: public Widget { */
/* public: */
/*   Button(std::string str):label(str) { */  
/*     tag = str; */
/*     label = " " + str + " "; */
/*     focusable = true; */
/*   } */
/*   WINDOW *win = nullptr; */

/*   size_t hash() override { */
/*     size_t h = 0; */
/*     hash_combine(h, label); */
/*     hash_combine(h, clicked); */
/*     return h; */
/*   } */
/*   void paint() override { */
/*     sizeX = static_cast<int>(label.size()); */
/*     sizeY = 1; */
/*     if (win == nullptr) { */
/*       win = Renderer::NewWindow(x, y, sizeX, sizeY, false); */
/*     } */
/*     wattron(win, COLOR_PAIR(focus ? SECONDARY: PRIMARY)); */
/*     wattron(win, A_REVERSE); */
/*     Renderer::PrintStringAt(win, 0, 0, label); */
/*     wattroff(win, A_REVERSE); */
/*     wattroff(win, COLOR_PAIR(focus ? PRIMARY: SECONDARY)); */
/*   } */

/*   void destroy() override { */
/*     delwin(win); */
/*   } */
/* private: */
/*   std::string label; */
/*   int paddingX = 1; */
/*   bool clicked = false; */
/* }; */

/* namespace GUI { */
/*   class Application { */
/*     Widget *prevHead = nullptr; */
/*     Widget *nextHead = nullptr; */
/*     std::queue<Widget*> eventConsumers; */

/*     public: */
/*     static Application Init() { */
/*       WINDOW* win = initscr(); */
/*       keypad(stdscr, true); */
/*       noecho(); */
/*       cbreak(); */
/*       start_color(); */
/*       init_pair(1, COLOR_WHITE, COLOR_BLACK); */
/*       init_pair(2, COLOR_BLUE, COLOR_YELLOW); */
/*       refresh(); */
/*       return Application{win}; */
/*     } */

/*     int EndFrame() { */
/*       if (prevHead) { */
/*         prevHead->destroy(); */
/*       } */
/*       prevHead = nextHead; */
/*       return 0; */
/*     } */

/*     int Render() { */
/*       nextHead->paint(); */
/*       return 0; */
/*     } */

/*     Widget* nextFocus() { */
/*       eventConsumers.push(eventConsumers.front()); */
/*       eventConsumers.pop(); */
/*      if (auto w = eventConsumers.front()) w->setFocus(true); */
/*      if (auto w = eventConsumers.back()) w->setFocus(false); */
/*       return eventConsumers.front(); */
/*     } */ 

/*     std::queue<Widget*> getEventConsumers() { */
/*       return eventConsumers; */
/*     } */
    
/*     Widget* prevFocus() { */
/*       // null 1 2 3 */
/*       auto end = eventConsumers.back(); // end = 2 */
/*       auto curr = eventConsumers.front(); */
/*       while (eventConsumers.front() != end) */
/*       { */ 
/*         eventConsumers.push(eventConsumers.front()); */
/*         eventConsumers.pop(); */
/*       } */
/*       // 3 null 1 2 */
/*       if (auto w = eventConsumers.front()) w->setFocus(true); */
/*       if (curr) curr->setFocus(false); */
/*       return eventConsumers.front(); */
/*     } */

/*     int NewFrame() { */
/*       eventConsumers = {}; */
/*       eventConsumers.push(nullptr); */
/*       nextHead = dynamic_cast<Widget*>(new Frame()); */
/*       return 0; */
/*     } */

/*     int AddWidget(lua_State *L, Widget* widget) { */
/*       std::cout << L; */
/*       nextHead->addChild(widget); */
/*       if (widget->getFocusable()) { */
/*         eventConsumers.push(widget); */
/*       } */
/*       return 0; */
/*     } */

/*     protected: */
/*     WINDOW* screen; */
/*     Application() = default; */
/*     explicit Application(WINDOW* mainWin) { */
/*        screen = mainWin; */ 
/*     } */
/*   }; */
/* } */
/* static void luaError(lua_State* L, std::string message) { */
/*       lua_pushboolean(L, false); */
/*       lua_pushstring(L, message.c_str()); */
/* } */

/* static int _NewFrame(lua_State* L) { */ 
/*   GUI::Application* app = static_cast<GUI::Application*>(lua_touserdata(L, 1)); */
/*   app->NewFrame(); */
/*   return 0; */
/* } */

/* static int _Render(lua_State* L) { */
/*   GUI::Application* app = static_cast<GUI::Application*>(lua_touserdata(L, 1)); */
/*   app->Render(); */
/*   return 0; */
/* } */

/* static int _EndFrame(lua_State* L) { */
/*   GUI::Application* app = static_cast<GUI::Application*>(lua_touserdata(L, 1)); */
/*   app->EndFrame(); */
/*   return 0; */
/* } */

/* static int _Label(lua_State* L) { */
/*     int args = 2; */
/*     int total = lua_gettop(L); */ 
/*     if (total == args) { */
/*       GUI::Application* app = static_cast<GUI::Application*>(lua_touserdata(L, 1)); */
/*       std::string label = lua_tostring(L, 2); */
/*       return app->AddWidget(L, dynamic_cast<Widget*>(new Label(label))); */
/*     } */
/*     else { */
/*       luaError(L, "Invalid no of arguments"); */
/*       return 2; */
/*     } */
/*     return 1; */
/* } */

/* static int _Button(lua_State* L) { */
/*     int args = 2; */
/*     int total = lua_gettop(L); */ 
/*     if (total == args) { */
/*       GUI::Application* app = static_cast<GUI::Application*>(lua_touserdata(L, 1)); */
/*       std::string label = lua_tostring(L, 2); */
/*       return app->AddWidget(L, dynamic_cast<Widget*>(new Button(label))); */
/*     } */
/*     else { */
/*       luaError(L, "Invalid no of arguments"); */
/*       return 2; */
/*     } */
/*     return 1; */
/* } */
/* int main() { */
/*   lua_State *L = luaL_newstate(); */
/*   luaL_openlibs(L); */

/*   lua_register(L, "_NewFrame", _NewFrame); */
/*   lua_register(L, "_EndFrame", _EndFrame); */
/*   lua_register(L, "_Render", _Render); */
/*   lua_register(L, "_Button", _Button); */
/*   lua_register(L, "_Label", _Label); */

/*   if (luaL_dofile(L, "luascript.lua")) { */
/*     std::cerr << "Something went wrong loading the chunk (syntax error?)" << std::endl; */
/*     std::cerr << lua_tostring(L, -1) << std::endl; */
/*     lua_pop(L,1); */
/*     return 1; */
/*   } */

/*   GUI::Application app = GUI::Application::Init(); */

/*   lua_getglobal(L, "Init"); */
/*   if (lua_isfunction(L, -1)) { */
/*     lua_pushlightuserdata(L, &app); */    
/*     if (!CheckLua(L, lua_pcall(L, 1, 1, 0))) { */
/*       return 1; */ 
/*     } */
/*   } */
/*   else { */
/*     std::cout << "No Init function"; */
/*     return 1; */
/*   } */

/*   lua_getglobal(L, "Update"); */
/*   if (lua_isfunction(L, -1)) { */
/*     if (!CheckLua(L, lua_pcall(L, 0, 1, 0))) { */
/*       return 1; */ 
/*     } else { */
/*       if (lua_isnumber(L, -1)) { */
/*         std::cout << lua_tonumber(L, -1); */
/*       } */
/*       else { */
/*         std::cout<<"Not a number"; */
/*       } */
/*     } */
/*   } */
  
/*   /1* app.NewFrame(); *1/ */
/*   /1* app.AddWidget(nullptr, dynamic_cast<Widget*>(new Button("Button 1"))); *1/ */
/*   /1* app.EndFrame(); *1/ */
/*   char ch; */  
/*   while (true) { */
/*     ch = static_cast<char>(getch()); */
/*     if (ch == 'j') { */
/*       Renderer::PrintStringAt(stdscr, 0, LINES - 4, "J was pressed"); */
/*       if (auto focused = app.prevFocus()) { */
/*         Renderer::PrintStringAt(stdscr, 0, LINES - 4, focused->getTag() + " Was pressed"); */
/*       } */
/*     } */ 
/*     if (ch == 'k') { */
/*       if (auto focused = app.nextFocus()) { */
/*         Renderer::PrintStringAt(stdscr, 0, LINES - 4, focused->getTag() + " Was pressed"); */
/*       } */
/*     } */
/*     app.Render(); */
/*   } */
/*   endwin(); */
/*   return 0; */
/* } */

/* /1* int main() { *1/ */
/* /1*   const int WIDTH = 50; *1/ */
/* /1*   const int HEIGHT = 50; *1/ */
/* /1*   GUI::Application::Init(); *1/ */
/* /1*   GUI::Application::DrawWindow(1, 1, WIDTH, HEIGHT); *1/ */
/* /1* } *1/ */
/* /1* { *1/ */
/* /1*   cout << "** Test Lua embedding" << endl; *1/ */
/* /1*   cout << "** Init Lua" << endl; *1/ */
/* /1*   lua_State *L = luaL_newstate(); *1/ */
/* /1*   cout << "** Load the (optional) standard libraries, to have the print function" << endl; *1/ */
/* /1*   luaL_openlibs(L); *1/ */
/* /1*   cout << "** Load chunk. without executing it" << endl; *1/ */
/* /1*   if (luaL_loadfile(L, "luascript.lua")) { *1/ */
/* /1*     cerr << "Something went wrong loading the chunk (syntax error?)" << endl; *1/ */
/* /1*     cerr << lua_tostring(L, -1) << endl; *1/ */
/* /1*     lua_pop(L,1); *1/ */
/* /1*   } *1/ */

/* /1*   cout << "** Make a insert a global var into Lua from C++" << endl; *1/ */
/* /1*   lua_pushnumber(L, 1.1); *1/ */
/* /1*   lua_setglobal(L, "cppvar"); *1/ */

/* /1*   cout << "** Execute the Lua chunk" << endl; *1/ */
/* /1*   if (lua_pcall(L,0, LUA_MULTRET, 0)) { *1/ */
/* /1*     cerr << "Something went wrong during execution" << endl; *1/ */
/* /1*     cerr << lua_tostring(L, -1) << endl; *1/ */
/* /1*     lua_pop(L,1); *1/ */
/* /1*   } *1/ */
  
/* /1*   cout << "** Read a global var from Lua into C++" << endl; *1/ */
/* /1*   lua_getglobal(L, "luavar"); *1/ */
/* /1*   double luavar = lua_tonumber(L,-1); *1/ */
/* /1*   lua_pop(L,1); *1/ */
/* /1*   cout << "C++ can read the value set from Lua luavar = " << luavar << endl; *1/ */

/* /1*   cout << "** Execute a Lua function from C++" << endl; *1/ */
/* /1*   lua_getglobal(L, "myluafunction"); *1/ */
/* /1*   lua_pushnumber(L, 5); *1/ */
/* /1*   lua_pcall(L, 1, 1, 0); *1/ */
/* /1*   cout << "The return value of the function was " << lua_tostring(L, -1) << endl; *1/ */
/* /1*   lua_pop(L,1); *1/ */

/* /1*   cout << "** Execute a C++ function from Lua" << endl; *1/ */
/* /1*   cout << "**** First register the function in Lua" << endl; *1/ */
/* /1*   lua_pushcfunction(L,l_cppfunction); *1/ */
/* /1*   lua_setglobal(L, "cppfunction"); *1/ */

/* /1*   cout << "**** Call a Lua function that uses the C++ function" << endl; *1/ */
/* /1*   lua_getglobal(L, "myfunction"); *1/ */
/* /1*   lua_pushnumber(L, 5); *1/ */
/* /1*   lua_pcall(L, 1, 1, 0); *1/ */
/* /1*   cout << "The return value of the function was " << lua_tonumber(L, -1) << endl; *1/ */
/* /1*   lua_pop(L,1); *1/ */

/* /1*   cout << "** Release the Lua enviroment" << endl; *1/ */
/* /1*   lua_close(L); *1/ */
/* /1* } *1/ */

