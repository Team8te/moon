# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.7)

set(_component_name server)

project(${_project_name})

# Set component type (library or executable).
set(_component_type executable)

# Set type library (STATIC or SHARED or empty).
set(_library_type)

SET(_source_files
	src/main.cpp
	src/server.cpp
	)

SET(_header_files
    include/server.hpp
    )

SET(_private_header_files
   )

SET(_private_source_files
   )

SET(_resource_files
   )

SET(_dependencies
    Boost
   )

SET(_link_libraries_whole_archive
   )

SET(_definitions
   )

## Config project settings, adding project source files and other.
include("${CMAKE_SOURCE_DIR}/cmake/ConfigProject.cmake")
