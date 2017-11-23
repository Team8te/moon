# This file for install projects configuration, added project source files
# and config project settings

add_definitions(${definitions})
   
# Disable compilation for private sources.
set_source_files_properties(${SOURCE_FILES}} 
                            PROPERTIES HEADER_FILE_ONLY TRUE)

set(${_project_name}_${_component_name}_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${_target_includes_directory}
    CACHE INTERNAL "${_project_name}_${_component_name} headers directory.")
                            
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

# Add include directories to a target.
target_include_directories(${_project_name}_${_component_name}
                        PUBLIC ${${_project_name}_${_component_name}_INCLUDE_DIR}
                        PRIVATE ${${_project_name}_${_component_name}_private_header})

# Link a target to given libraries.
target_link_libraries_ex(TARGET ${_project_name}_${_component_name}
                        LIBRARIES ${link_target}
                        OPTIMIZE YES)

# Link a target to given libraries.
#target_link_libraries_ex(TARGET ${_project_name}_${_component_name}
#                        LIBRARIES ${_target_libraries_whole_archive}
#                        OPTIMIZE NO)

