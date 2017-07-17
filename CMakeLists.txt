# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.5)

set(_project_name moon)

project(${_project_name})

SET(header_files)

SET(private_header_files)

SET(source_files
	src/main.cpp)

SET(private_source_files)

SET(resource_files)

SET(dependencies)

SET(link_target)

SET(definitions)

# Config project settings, adding project source files and other.
include("${CMAKE_SOURCE_DIR}/ConfigProject.cmake")