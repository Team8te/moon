# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.7)

set(_component_name server)

project(${_project_name})

# Set component type (library or executable).
set(_component_type executable)

# Set type library (STATIC or SHARED or empty).
set(_library_type)

SET(source_files
	src/main.cpp
	src/server.cpp
	)

SET(header_files
    include/server.hpp
    )

SET(private_header_files
   )

SET(private_source_files
   )

SET(resource_files
   )

SET(dependencies
   )

SET(link_target
   )

SET(_target_libraries_whole_archive
   )

SET(definitions
   )

## Config project settings, adding project source files and other.
include("${CMAKE_SOURCE_DIR}/cmake/ConfigProject.cmake")
