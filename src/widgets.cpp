#include "widgets.h"
#include <stdlib.h>

namespace GUI {
  void VerticalContainer::draw(Renderer *renderer) {
    std::cout << "calling vertical container draw" << std::endl;
    int offsetY = position.second; 
    std::cout << "offset" << std::endl;
    for (auto c: children) { 
      c->position.first= position.first; 
      std::cout << "calling vertical container draw" << std::endl;
      c->position.second = offsetY;
      c->draw(renderer);
      offsetY += c->options.size.second;
      options.size.first = std::max(options.size.first, c->options.size.first);
      options.size.second += c->options.size.second;
    }
  }

  void HorizontalContainer::draw(Renderer *renderer) {
    int offsetX = position.first; 
    for (auto c: children) { 
      c->position.first= offsetX; 
      c->position.second = position.second;
      c->draw(renderer);
      offsetX += c->options.size.first;
      options.size.first += c->options.size.first;
      options.size.second = std::max(options.size.second, c->options.size.second);
    }
  }

  Label::Label(std::string l):label(l) {
    options.size.first = static_cast<int>(label.size());
    options.size.second = 1;
  }

  void Label::draw(Renderer* renderer) {
    if (!win) {
      win = renderer->newWindow(position, options.size);
    }
    renderer->clearWindow(win);
    renderer->putStringAt(win, {0, 0}, label);
    renderer->refresh(win);
  } 

  void Label::addChild(Node*) {};

  Button::Button(std::string l):label(l) {
    options.canBeFocused = true;
    options.size.first = static_cast<int>(label.size()) + 2;
    options.size.second = 3;
  }

  void Button::draw(Renderer* renderer) {
    if (!win) {
      win = renderer->newWindow(position, options.size);
    }
    renderer->clearWindow(win);
    if (options.focus) renderer->enableHighlight(win);
    renderer->putStringAt(win, {1, 1}, label);
    if (options.focus) renderer->disableHighlight(win);
    renderer->addBox(win, 0);
    renderer->refresh(win);
  } 

  bool Button::onKey(int key) {
    if (key == KEY_ENTER) {
      for(auto fn: clickEventListener) {
        if(fn()) return true;
      }
    }
    return false;
  }

  void Button::addChild(Node*) {};

  ScrollingContainer::ScrollingContainer(std::string label, int_pair_t size): label(label) {
    options.canBeFocused = true;
    options.size.first = size.first + 2;
    options.size.second = size.second + 2;
  }

  ScrollingContainer::ScrollingContainer(std::string label, vector<std::string> c, int_pair_t size): label(label) {
    options.canBeFocused = true;
    content = c;
    options.size.first = size.first + 2;
    options.size.second = size.second + 2;
  }

  void ScrollingContainer::draw(Renderer *renderer) {
    int offsetY = 0; 
    if (!win) {
      win = renderer->newWindow(position, options.size);
    }
    renderer->clearWindow(win);
    renderer->addBox(win, 0);
    if (options.focus) renderer->enableHighlight(win);
    renderer->putStringAt(win, {1, 0}, label + " " + std::to_string(startIndex) + " " + std::to_string(current));
    if (options.focus) renderer->disableHighlight(win);
    if (startIndex < static_cast<int>(content.size())) {
      for (auto it = content.begin() + startIndex; startIndex + offsetY < content.size(); ++it, ++offsetY) { 

        if (offsetY == current) renderer->enableHighlight(win);
        std::string entry = *it;
        auto size = static_cast<size_t>(options.size.first) - 2;
        if (entry.size() > size) {
          entry = entry.substr(0, size - 4) + "...";
        }
        entry.append(size - entry.length() - 1, ' ');
        renderer->putStringAt(win, {1, offsetY + 1}, entry);
        if (offsetY == current) renderer->disableHighlight(win);
        
      }
    }
    renderer->refresh(win);
  }

  bool ScrollingContainer::onKey(int key) {
    int maxVisibleEntries = options.size.second - 2;
    int maxEntries = static_cast<int>(content.size());
    // DOWN
    if (key == 258) {
      if (current + startIndex >= maxEntries - 1) {
        return true;  
      }
      if (++current >= maxVisibleEntries) {
        --current;
        ++startIndex;
      }
    }
    // UP
    if (key == 259) {
      if (current + startIndex == 0) {
        return true;  
      }
      if (--current < 0) {
        ++current;
        --startIndex;
      }
    }
    return true;
  }
}