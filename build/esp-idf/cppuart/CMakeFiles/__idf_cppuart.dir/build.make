# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.26.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.26.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build

# Include any dependencies generated for this target.
include esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/flags.make

esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj: esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/flags.make
esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj: /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/components/cppuart/cppuart.cpp
esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj: esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj"
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && /Users/iandownie/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj -MF CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj.d -o CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj -c /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/components/cppuart/cppuart.cpp

esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_cppuart.dir/cppuart.cpp.i"
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && /Users/iandownie/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/components/cppuart/cppuart.cpp > CMakeFiles/__idf_cppuart.dir/cppuart.cpp.i

esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_cppuart.dir/cppuart.cpp.s"
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && /Users/iandownie/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/components/cppuart/cppuart.cpp -o CMakeFiles/__idf_cppuart.dir/cppuart.cpp.s

# Object files for target __idf_cppuart
__idf_cppuart_OBJECTS = \
"CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj"

# External object files for target __idf_cppuart
__idf_cppuart_EXTERNAL_OBJECTS =

esp-idf/cppuart/libcppuart.a: esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/cppuart.cpp.obj
esp-idf/cppuart/libcppuart.a: esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/build.make
esp-idf/cppuart/libcppuart.a: esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libcppuart.a"
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && $(CMAKE_COMMAND) -P CMakeFiles/__idf_cppuart.dir/cmake_clean_target.cmake
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_cppuart.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/build: esp-idf/cppuart/libcppuart.a
.PHONY : esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/build

esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/clean:
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart && $(CMAKE_COMMAND) -P CMakeFiles/__idf_cppuart.dir/cmake_clean.cmake
.PHONY : esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/clean

esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/depend:
	cd /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/components/cppuart /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart /Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/cppuart/CMakeFiles/__idf_cppuart.dir/depend
