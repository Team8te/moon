# EXCEPT WHERE OTHERWISE STATED, THE INFORMATION AND SOURCE CODE CONTAINED
# HEREIN AND IN RELATED FILES IS THE EXCLUSIVE PROPERTY OF PARAGON SOFTWARE
# GROUP COMPANY AND MAY NOT BE EXAMINED, DISTRIBUTED, DISCLOSED, OR REPRODUCED
# IN WHOLE OR IN PART WITHOUT EXPLICIT WRITTEN AUTHORIZATION FROM THE COMPANY.
#
# Copyright (c) 1994-2016 Paragon Software Group, All rights reserved.
#
# UNLESS OTHERWISE AGREED IN A WRITING SIGNED BY THE PARTIES, THIS SOFTWARE IS
# PROVIDED "AS-IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE, ALL OF WHICH ARE HEREBY DISCLAIMED. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF NOT ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.

#.rst
# TargetLinkLibrariesEx 
# ~~~~~~~~~
#
# Generates installation rules for a subproject.
#
# Rules specified by calls to this command within a source directory are executed 
# in order during installation. The order across directories is not defined. 
#
# Use this module by invoking install_ex with the form::
#
#   install_ex(
#       TARGET <target name>
#        LIBRARIES <list libraries>
#        OPTIMIZE NO|YES)

# Set the minimum required version of cmake for a project.
cmake_minimum_required(VERSION 3.5)

#
# Include required modules.
#
include(CMakeParseArguments)

#
# target_link_libraries_ex.
# Add dependency library to module.
#
function(target_link_libraries_ex )
    set(_options )
    set(_oneValueArgs TARGET OPTIMIZE)
    set(_multiValueArgs LIBRARIES)
    cmake_parse_arguments(_args "${_options}" "${_oneValueArgs}" "${_multiValueArgs}" ${ARGN})

    # Check incoming arguments.
    if("${_args_TARGET}" STREQUAL "")
        message(FATAL_ERROR "No set parameter TARGET for target_link_libraries_ex")
    endif()

    set(_nameTarget "${_args_TARGET}")
    
    if(${_args_OPTIMIZE} STREQUAL "" OR ${_args_OPTIMIZE} STREQUAL "YES")
        set(_optimizeLink ON)
    endif()

    set(_libraries ${_args_LIBRARIES})
    
    if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_COMPILER_IS_GNUCC)
        if(NOT _optimizeLink AND (NOT "${_libraries}" STREQUAL "") )
            set(_libraries "-Wl,--whole-archive"
                           ${_libraries}
                           "-Wl,--no-whole-archive")
        endif()
    endif()
    
    target_link_libraries(${_nameTarget} ${_libraries})

endfunction()
