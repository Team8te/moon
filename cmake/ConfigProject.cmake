# This file for install projects configuration, added project source files
# and config project settings

# Set the minimum required version of cmake for a project.
CMAKE_MINIMUM_REQUIRED(VERSION 3.5)

INCLUDE("${CMAKE_SOURCE_DIR}/cmake/TargetLinkLibrariesEx.cmake")
INCLUDE("${CMAKE_SOURCE_DIR}/cmake/ConfigDependencies.cmake")

find_dependencies(DEPENDENCIES ${_dependencies}
#                  DEP_DEFINISHONS _dep_definishons
                  DEP_INCLUDE_HEADERS _dep_include
                  DEP_LIBRARIES _dep_lib)

LIST(APPEND _definitions 
          ${_dep_definishons})
                  
ADD_DEFINITIONS(${_definitions})

INCLUDE_DIRECTORIES(${_dep_include})

LIST(APPEND _link_labraries ${_dep_lib})
 
# Disable compilation for private sources.
SET_SOURCE_FILES_PROPERTIES(${SOURCE_FILES}} 
                            PROPERTIES HEADER_FILE_ONLY TRUE)

SET(${_project_name}_${_component_name}_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${_target_includes_directory}
    CACHE INTERNAL "${_project_name}_${_component_name} headers directory.")
                            
SET(${_project_name}_${_component_name}_library_type "${_library_type}")

SET (${_project_name}_${_component_name}_source ${_source_files})

SET (${_project_name}_${_component_name}_header ${_header_files})

SET (${_project_name}_${_component_name}_private_header ${_private_header_files})

SET (${_project_name}_${_component_name}_private_source ${_private_source_files})



IF("${_component_type}" STREQUAL "library")
    ADD_LIBRARY(${_project_name}_${_component_name}
                ${${_project_name}_${_component_name}_library_type}
                ${${_project_name}_${_component_name}_header}
                ${${_project_name}_${_component_name}_private_header}
                ${${_project_name}_${_component_name}_source}
                ${${_project_name}_${_component_name}_private_source}
                ${${_project_name}_${_component_name}_RESOURCES})
ELSEIF("${_component_type}" STREQUAL "executable")
    ADD_EXECUTABLE(${_project_name}_${_component_name}
                ${${_project_name}_${_component_name}_header}
                ${${_project_name}_${_component_name}_private_header}
                ${${_project_name}_${_component_name}_source}
                ${${_project_name}_${_component_name}_private_source})
ENDIF()

# Add include directories to a target.
target_include_directories(${_project_name}_${_component_name}
                        PUBLIC ${${_project_name}_${_component_name}_INCLUDE_DIR}
                        PRIVATE ${${_project_name}_${_component_name}_private_header})

# Link a target to given libraries.
target_link_libraries_ex(TARGET ${_project_name}_${_component_name}
                        LIBRARIES ${_link_labraries}
                        OPTIMIZE YES)

# Link a target to given libraries.
target_link_libraries_ex(TARGET ${_project_name}_${_component_name}
                        LIBRARIES ${_link_libraries_whole_archive}
                        OPTIMIZE NO)

