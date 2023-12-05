cmake_minimum_required(VERSION 3.15)

# Setup vcpkg script with CMake (note: should be placed before project() call)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

# load cmake modules
include(cmake/group_source.cmake)
include(cmake/display_environment.cmake)
include(cmake/env_base.cmake)


project(Example)

# setting for C
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

# setting for CPP
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#  global flag to cause add_library to create shared libraries if on
set(Boost_NO_SYSTEM_PATHS True)


# vcpkg dependencies
find_package(fmt CONFIG REQUIRED)

link_directories(${VCPKG_INSTALLED_DIR}$<$<CONFIG:Debug>:/debug>/lib)

add_subdirectory(lib)
add_subdirectory(app)