# cmake requirement
cmake_minimum_required(VERSION 3.13)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# project information
project(mylib
    VERSION 1.0
    DESCRIPTION "mylib project"
    LANGUAGES CXX
)

# cmake files include
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
include(cpplint)
include(metrixpp)

# set c++ default
set (CMAKE_CXX_STANDARD 11)

# in-source build guard
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there. You may need to remove CMakeCache.txt. ")
endif()

# add build target
add_subdirectory(lib/mylib)
add_subdirectory(examples EXCLUDE_FROM_ALL)

# 静的解析
add_custom_target(inu echo wanwan)