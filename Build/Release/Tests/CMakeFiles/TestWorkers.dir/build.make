# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/Jacob/Dev/Repos/JobRocket

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/Jacob/Dev/Repos/JobRocket/Build/Release

# Include any dependencies generated for this target.
include Tests/CMakeFiles/TestWorkers.dir/depend.make

# Include the progress variables for this target.
include Tests/CMakeFiles/TestWorkers.dir/progress.make

# Include the compile flags for this target's objects.
include Tests/CMakeFiles/TestWorkers.dir/flags.make

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o: Tests/CMakeFiles/TestWorkers.dir/flags.make
Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o: ../../Tests/TestWorker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Jacob/Dev/Repos/JobRocket/Build/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestWorkers.dir/TestWorker.cpp.o -c /Users/Jacob/Dev/Repos/JobRocket/Tests/TestWorker.cpp

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestWorkers.dir/TestWorker.cpp.i"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Jacob/Dev/Repos/JobRocket/Tests/TestWorker.cpp > CMakeFiles/TestWorkers.dir/TestWorker.cpp.i

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestWorkers.dir/TestWorker.cpp.s"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Jacob/Dev/Repos/JobRocket/Tests/TestWorker.cpp -o CMakeFiles/TestWorkers.dir/TestWorker.cpp.s

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.requires:

.PHONY : Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.requires

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.provides: Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.requires
	$(MAKE) -f Tests/CMakeFiles/TestWorkers.dir/build.make Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.provides.build
.PHONY : Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.provides

Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.provides.build: Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o


Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o: Tests/CMakeFiles/TestWorkers.dir/flags.make
Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o: ../../Tests/TestsMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/Jacob/Dev/Repos/JobRocket/Build/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestWorkers.dir/TestsMain.cpp.o -c /Users/Jacob/Dev/Repos/JobRocket/Tests/TestsMain.cpp

Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestWorkers.dir/TestsMain.cpp.i"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/Jacob/Dev/Repos/JobRocket/Tests/TestsMain.cpp > CMakeFiles/TestWorkers.dir/TestsMain.cpp.i

Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestWorkers.dir/TestsMain.cpp.s"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/Jacob/Dev/Repos/JobRocket/Tests/TestsMain.cpp -o CMakeFiles/TestWorkers.dir/TestsMain.cpp.s

Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.requires:

.PHONY : Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.requires

Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.provides: Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.requires
	$(MAKE) -f Tests/CMakeFiles/TestWorkers.dir/build.make Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.provides.build
.PHONY : Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.provides

Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.provides.build: Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o


# Object files for target TestWorkers
TestWorkers_OBJECTS = \
"CMakeFiles/TestWorkers.dir/TestWorker.cpp.o" \
"CMakeFiles/TestWorkers.dir/TestsMain.cpp.o"

# External object files for target TestWorkers
TestWorkers_EXTERNAL_OBJECTS =

Tests/TestWorkers: Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o
Tests/TestWorkers: Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o
Tests/TestWorkers: Tests/CMakeFiles/TestWorkers.dir/build.make
Tests/TestWorkers: libJobRocket.a
Tests/TestWorkers: ../../Deps/hwloc/install/lib/libhwloc.dylib
Tests/TestWorkers: Deps/glfw-3.2.1/src/libglfw3.a
Tests/TestWorkers: Tests/CMakeFiles/TestWorkers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/Jacob/Dev/Repos/JobRocket/Build/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable TestWorkers"
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestWorkers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Tests/CMakeFiles/TestWorkers.dir/build: Tests/TestWorkers

.PHONY : Tests/CMakeFiles/TestWorkers.dir/build

Tests/CMakeFiles/TestWorkers.dir/requires: Tests/CMakeFiles/TestWorkers.dir/TestWorker.cpp.o.requires
Tests/CMakeFiles/TestWorkers.dir/requires: Tests/CMakeFiles/TestWorkers.dir/TestsMain.cpp.o.requires

.PHONY : Tests/CMakeFiles/TestWorkers.dir/requires

Tests/CMakeFiles/TestWorkers.dir/clean:
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests && $(CMAKE_COMMAND) -P CMakeFiles/TestWorkers.dir/cmake_clean.cmake
.PHONY : Tests/CMakeFiles/TestWorkers.dir/clean

Tests/CMakeFiles/TestWorkers.dir/depend:
	cd /Users/Jacob/Dev/Repos/JobRocket/Build/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/Jacob/Dev/Repos/JobRocket /Users/Jacob/Dev/Repos/JobRocket/Tests /Users/Jacob/Dev/Repos/JobRocket/Build/Release /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests /Users/Jacob/Dev/Repos/JobRocket/Build/Release/Tests/CMakeFiles/TestWorkers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Tests/CMakeFiles/TestWorkers.dir/depend
