# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhanp/gpulab/GPU_lab/queue_device

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhanp/gpulab/GPU_lab/queue_device/build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/main.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/main.f90.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/main.f90.o: ../main.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhanp/gpulab/GPU_lab/queue_device/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/main.dir/main.f90.o"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/zhanp/gpulab/GPU_lab/queue_device/main.f90 -o CMakeFiles/main.dir/main.f90.o

CMakeFiles/main.dir/main.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/main.dir/main.f90.i"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/zhanp/gpulab/GPU_lab/queue_device/main.f90 > CMakeFiles/main.dir/main.f90.i

CMakeFiles/main.dir/main.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/main.dir/main.f90.s"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/zhanp/gpulab/GPU_lab/queue_device/main.f90 -o CMakeFiles/main.dir/main.f90.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.f90.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/main.f90.o
main: CMakeFiles/main.dir/build.make
main: CMakeFiles/event_module.dir/EventQueueItem.f90.o
main: CMakeFiles/sort_module.dir/sort_module.f90.o
main: CMakeFiles/event_queue.dir/event_queue.f90.o
main: libthrust_sort.so
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhanp/gpulab/GPU_lab/queue_device/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking Fortran executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main
.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/zhanp/gpulab/GPU_lab/queue_device/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhanp/gpulab/GPU_lab/queue_device /home/zhanp/gpulab/GPU_lab/queue_device /home/zhanp/gpulab/GPU_lab/queue_device/build /home/zhanp/gpulab/GPU_lab/queue_device/build /home/zhanp/gpulab/GPU_lab/queue_device/build/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

