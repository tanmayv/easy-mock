# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.20.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.20.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/i346208/personal/easy-mock

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/i346208/personal/easy-mock/build

# Include any dependencies generated for this target.
include test/CMakeFiles/relaxed_constexpr_tests.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/relaxed_constexpr_tests.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/relaxed_constexpr_tests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/relaxed_constexpr_tests.dir/flags.make

test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o: test/CMakeFiles/relaxed_constexpr_tests.dir/flags.make
test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o: ../test/constexpr_tests.cpp
test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o: test/CMakeFiles/relaxed_constexpr_tests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/i346208/personal/easy-mock/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o"
	cd /Users/i346208/personal/easy-mock/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o -MF CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o.d -o CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o -c /Users/i346208/personal/easy-mock/test/constexpr_tests.cpp

test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.i"
	cd /Users/i346208/personal/easy-mock/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/i346208/personal/easy-mock/test/constexpr_tests.cpp > CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.i

test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.s"
	cd /Users/i346208/personal/easy-mock/build/test && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/i346208/personal/easy-mock/test/constexpr_tests.cpp -o CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.s

# Object files for target relaxed_constexpr_tests
relaxed_constexpr_tests_OBJECTS = \
"CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o"

# External object files for target relaxed_constexpr_tests
relaxed_constexpr_tests_EXTERNAL_OBJECTS =

bin/relaxed_constexpr_tests: test/CMakeFiles/relaxed_constexpr_tests.dir/constexpr_tests.cpp.o
bin/relaxed_constexpr_tests: test/CMakeFiles/relaxed_constexpr_tests.dir/build.make
bin/relaxed_constexpr_tests: lib/libcatch_main.a
bin/relaxed_constexpr_tests: test/CMakeFiles/relaxed_constexpr_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/i346208/personal/easy-mock/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/relaxed_constexpr_tests"
	cd /Users/i346208/personal/easy-mock/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/relaxed_constexpr_tests.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/i346208/personal/easy-mock/build/test && /usr/local/Cellar/cmake/3.20.0/bin/cmake -D TEST_TARGET=relaxed_constexpr_tests -D TEST_EXECUTABLE=/Users/i346208/personal/easy-mock/build/bin/relaxed_constexpr_tests -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/Users/i346208/personal/easy-mock/build/test -D TEST_SPEC= -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX=relaxed_constexpr. -D TEST_SUFFIX= -D TEST_LIST=relaxed_constexpr_tests_TESTS -D TEST_REPORTER=xml -D TEST_OUTPUT_DIR=. -D TEST_OUTPUT_PREFIX=relaxed_constexpr. -D TEST_OUTPUT_SUFFIX=.xml -D CTEST_FILE=/Users/i346208/personal/easy-mock/build/test/relaxed_constexpr_tests_tests-1418042.cmake -P /Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/cmake/Catch2/CatchAddTests.cmake

# Rule to build all files generated by this target.
test/CMakeFiles/relaxed_constexpr_tests.dir/build: bin/relaxed_constexpr_tests
.PHONY : test/CMakeFiles/relaxed_constexpr_tests.dir/build

test/CMakeFiles/relaxed_constexpr_tests.dir/clean:
	cd /Users/i346208/personal/easy-mock/build/test && $(CMAKE_COMMAND) -P CMakeFiles/relaxed_constexpr_tests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/relaxed_constexpr_tests.dir/clean

test/CMakeFiles/relaxed_constexpr_tests.dir/depend:
	cd /Users/i346208/personal/easy-mock/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/i346208/personal/easy-mock /Users/i346208/personal/easy-mock/test /Users/i346208/personal/easy-mock/build /Users/i346208/personal/easy-mock/build/test /Users/i346208/personal/easy-mock/build/test/CMakeFiles/relaxed_constexpr_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/relaxed_constexpr_tests.dir/depend

