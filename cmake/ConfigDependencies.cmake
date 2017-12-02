# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.5)

#
# Include required modules.
#
include(CMakeParseArguments)

function(find_dependencies)
    SET(_options )
    SET(_oneValueArgs)
    SET(_multiValueArgs DEPENDENCIES DEP_INCLUDE_HEADERS DEP_LIBRARIES)
    cmake_parse_arguments(_args "${_options}" "${_oneValueArgs}" "${_multiValueArgs}" ${ARGN})

    FOREACH(_dep ${_args_DEPENDENCIES})
        
        # Use for catch of component in dependency
        # like ("dependency.component")
        SET(_dep_component) 
        SET(_dep_with_components ${_dep}) 
        STRING(REPLACE "." ";"
               _dep_with_components ${_dep_with_components})
               
        LIST(LENGTH _dep_with_components _dep_size)
        IF(_dep_size GREATER 1)
            MATH(EXPR _dep_size ${_dep_size})
            LIST(GET _dep_with_components 1 _dep_component)
            
            STRING(REGEX REPLACE ".${_dep_component}$" "" _dep "${_dep}")
            
            SET (_dep_component "COMPONENTS ${_dep_component}")
            
        ENDIF()
        
        SET(_path_to_dep "../../${_dep}")
        IF(EXISTS "${_path_to_dep}")
            GET_FILENAME_COMPONENT(_path_to_dep "${_path_to_dep}" ABSOLUTE)
            list(APPEND CMAKE_PREFIX_PATH "${_path_to_dep}")
        ENDIF()
        FIND_PACKAGE(${_dep})
        
        IF(${_dep}_FOUND)
            SET(${_args_DEP_INCLUDE_HEADERS} ${${_dep}_INCLUDE_DIR}  PARENT_SCOPE)
            SET(${_args_DEP_LIBRARIES}       ${${_dep}_LIBRARIES}    PARENT_SCOPE)
        ELSE()
            MESSAGE(FATAL_ERROR "Can't find library \"${_dep}\". \nIf you want to link a library, place it at the same level as the project")
        ENDIF()
        
    ENDFOREACH()
    
endfunction()