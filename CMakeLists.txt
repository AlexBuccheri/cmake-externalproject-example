cmake_minimum_required(VERSION 3.15)

project(Demo-ExternalProject_add VERSION 8.0.0
                 DESCRIPTION "Test CMake Commands")

# Set folder structure for build directory
set(CMAKE_Fortran_BIN_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_Fortran_LIB_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/modules)

# Define an external target, libXC, which is built from ExternalProject
include(cmake/libxc.cmake)

