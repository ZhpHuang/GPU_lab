cmake_minimum_required(VERSION 3.18)
project(MyProject Fortran CXX CUDA)

# Specify nvfortran as the Fortran compiler
set(CMAKE_Fortran_COMPILER nvfortran)

# Set any necessary compile flags
set(CMAKE_Fortran_FLAGS "-O2 -Mfree -Mpreprocess -Mbackslash -traceback -acc -fast -Mnoautoinline -cuda -gpu=cc86,deepcopy -Minfo -fPIC -Wall -Kieee")

# Enable CUDA support
find_package(CUDA REQUIRED)

# Specify the location of the Thrust library (if needed)
# include_directories(${CUDA_INCLUDE_DIRS})

# Create a shared library for the Thrust wrapper
add_library(thrust_sort SHARED thrust_sort_wrapper.cu)
# add_library(atomic SHARED atomic_wrapper.cu)

# Make sure to specify the C++ language for the wrapper
set_target_properties(thrust_sort PROPERTIES LINKER_LANGUAGE CXX)
# set_target_properties(atomic PROPERTIES LINKER_LANGUAGE CXX)

# Compile the Fortran sort module
add_library(event_module OBJECT EventQueueItem.f90)
add_library(sort_module OBJECT sort_module.f90)
add_library(event_queue OBJECT event_queue.f90)

# Add the main executable
add_executable(main main.f90)

# Link the thrust_sort library to the main executable
target_link_libraries(main PRIVATE thrust_sort)
# target_link_libraries(main PRIVATE atomic)

# If the sort_module contains any necessary linking, include that here as well
target_link_libraries(main PRIVATE $<TARGET_OBJECTS:event_module>)
target_link_libraries(main PRIVATE $<TARGET_OBJECTS:sort_module>)
target_link_libraries(main PRIVATE $<TARGET_OBJECTS:event_queue>)
