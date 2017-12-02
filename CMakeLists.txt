# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.7)

set(_project_name moon)

project(${_project_name})

set(_components 
    server
   )
   
# Add output directory for archives project.
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    CACHE PATH "Directory where all the .lib files are dumped.")

# Add output directory for shared lib and executive files project.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
    CACHE PATH "Directory where .exe and .dll files are dumped.")

# Add output directory for shared .so.
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    CACHE PATH "Directory where .so files are dumped.")

foreach(_comp ${_components})
    add_subdirectory(${_comp})
endforeach()