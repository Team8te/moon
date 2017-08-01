# This file for install projects configuration, added project source files
# and config project settings

add_definitions(${definitions})
   
# Disable compilation for private sources.
set_source_files_properties(${SOURCE_FILES}} 
                            PROPERTIES HEADER_FILE_ONLY TRUE)

set(${_project_name}_${_component_name}_library_type "${_library_type}")

set (${_project_name}_${_component_name}_source ${source_files})

set (${_project_name}_${_component_name}_header ${header_files})

set (${_project_name}_${_component_name}_private_header ${private_header_files})

set (${_project_name}_${_component_name}_private_source ${private_source_files})

if("${_component_type}" STREQUAL "library")
    add_library(${_project_name}_${_component_name}
                ${${_project_name}_${_component_name}_library_type}
                ${${_project_name}_${_component_name}_header}
                ${${_project_name}_${_component_name}_private_header}
                ${${_project_name}_${_component_name}_source}
                ${${_project_name}_${_component_name}_private_source}
                ${${_project_name}_${_component_name}_RESOURCES})
elseif("${_component_type}" STREQUAL "executable")
    add_executable(${_project_name}_${_component_name}
                ${${_project_name}_${_component_name}_header}
                ${${_project_name}_${_component_name}_private_header}
                ${${_project_name}_${_component_name}_source}
                ${${_project_name}_${_component_name}_private_source})
endif()



