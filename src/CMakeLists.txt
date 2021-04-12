option(CPP_STARTER_USE_QT "Enable compilation of QT sample" OFF)
option(CPP_STARTER_USE_FLTK "Enable compilation of FLTK sample" OFF)
option(CPP_STARTER_USE_GTKMM "Enable compilation of GTKMM sample" OFF)
option(CPP_STARTER_USE_IMGUI "Enable compilation of ImGui sample" OFF)
option(CPP_STARTER_USE_NANA "Enable compilation of Nana GUI sample" OFF)
option(CPP_STARTER_USE_SDL "Enable compilation of SDL sample" OFF)
option(CMAKE_EXPORT_COMPILE_COMMANDS "Enable Compile command" ON)

# sdl
if(CPP_STARTER_USE_SDL)
  message("Using SDL2")
  add_subdirectory(sdl)
endif()

# qt
if(CPP_STARTER_USE_QT)
  message("Using Qt")
  add_subdirectory(qt)
endif()

# fltk test
if(CPP_STARTER_USE_FLTK)
  message("Using FLTK")
  add_subdirectory(fltk)
endif()

# gtkmm test
if(CPP_STARTER_USE_GTKMM)
  message("Using gtkmm")
  add_subdirectory(gtkmm)
endif()

# imgui example
if(CPP_STARTER_USE_IMGUI)
  message("Using Dear ImGui")
  add_subdirectory(imgui)
endif()

# Nana
if(CPP_STARTER_USE_NANA)
  message("Using Nana")
  add_subdirectory(nana)
endif()

find_library (
    LUA
    NAMES lua # what to look for
    HINTS "${CMAKE_SOURCE_DIR}/lib" # where to look
    NO_DEFAULT_PATH # do not search system default paths
)
message(STATUS "Found Lua: [${LUA}]")
# Generic test that uses conan libs
add_executable(intro main.cpp luainterface.cpp gui.cpp widgets.cpp)
include_directories(lib)
target_link_libraries(
  intro
  PRIVATE project_options
          project_warnings
          ${LUA}
          CONAN_PKG::docopt.cpp
          CONAN_PKG::restinio
          CONAN_PKG::ncurses
          CONAN_PKG::fmt
          CONAN_PKG::spdlog)
