# This file for install projects configuration, added project source files
# and config project settings

add_definitions(${definitions})

set(${_project_name}_${_component_name}_library_type "${_library_type}"
    CACHE STRING "Type of ${_project_name}_${_component_name} library to be created (STATIC|SHARED).")

# Set a root directory for include files.
set(${_project_name}_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${_target_includes_directory}
    CACHE INTERNAL "${_project_name}_${_component_name} headers directory.")

# Set a root directory for include files.
# set(${_project_name}_${_component_name}_PRIVATE_INCLUDE_DIR ${_private_includes_directory})

# Put a list of header files into the cache.
set(${_project_name}_HEADERS ${header_files})

# Put a list of private headers into the cache.
set(${_project_name}_PRIVATE_HEADERS ${private_header_files})

# Put a list of sources into the cache.
set(${_project_name}_SOURCES ${source_files})

# Put a list of private sources into the cache.
set(${_project_name}_PRIVATE_SOURCES ${private_source_files})

# Put a list of resources into the cache.
set(${_project_name}_RESOURCES ${resource_files}
    CACHE INTERNAL "${_project_name} resources")
    
# Disable compilation for private sources.
set_source_files_properties(${${_project_name}_PRIVATE_SOURCES} 
                            PROPERTIES HEADER_FILE_ONLY TRUE)

add_executable(${_project_name}
            ${${_project_name}_HEADERS}
            ${${_project_name}_PRIVATE_HEADERS}
            ${${_project_name}_SOURCES}
            ${${_project_name}_PRIVATE_SOURCES}
            ${${_project_name}_RESOURCES})



