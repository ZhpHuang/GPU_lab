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
include CMakeFiles/event_queue.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/event_queue.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/event_queue.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/event_queue.dir/flags.make

CMakeFiles/event_queue.dir/event_queue.f90.o: CMakeFiles/event_queue.dir/flags.make
CMakeFiles/event_queue.dir/event_queue.f90.o: ../event_queue.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhanp/gpulab/GPU_lab/queue_device/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/event_queue.dir/event_queue.f90.o"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/zhanp/gpulab/GPU_lab/queue_device/event_queue.f90 -o CMakeFiles/event_queue.dir/event_queue.f90.o

CMakeFiles/event_queue.dir/event_queue.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/event_queue.dir/event_queue.f90.i"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/zhanp/gpulab/GPU_lab/queue_device/event_queue.f90 > CMakeFiles/event_queue.dir/event_queue.f90.i

CMakeFiles/event_queue.dir/event_queue.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/event_queue.dir/event_queue.f90.s"
	nvfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/zhanp/gpulab/GPU_lab/queue_device/event_queue.f90 -o CMakeFiles/event_queue.dir/event_queue.f90.s

event_queue: CMakeFiles/event_queue.dir/event_queue.f90.o
event_queue: CMakeFiles/event_queue.dir/build.make
.PHONY : event_queue

# Rule to build all files generated by this target.
CMakeFiles/event_queue.dir/build: event_queue
.PHONY : CMakeFiles/event_queue.dir/build

CMakeFiles/event_queue.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/event_queue.dir/cmake_clean.cmake
.PHONY : CMakeFiles/event_queue.dir/clean

CMakeFiles/event_queue.dir/depend:
	cd /home/zhanp/gpulab/GPU_lab/queue_device/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhanp/gpulab/GPU_lab/queue_device /home/zhanp/gpulab/GPU_lab/queue_device /home/zhanp/gpulab/GPU_lab/queue_device/build /home/zhanp/gpulab/GPU_lab/queue_device/build /home/zhanp/gpulab/GPU_lab/queue_device/build/CMakeFiles/event_queue.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/event_queue.dir/depend
