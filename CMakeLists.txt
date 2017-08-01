# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.7)

set(_project_name moon)

project(${_project_name})

set(_components 
    server
   )

foreach(_comp ${_components})
    add_subdirectory(${_comp})
endforeach()

