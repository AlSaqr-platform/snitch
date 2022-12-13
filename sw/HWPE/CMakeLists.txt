# Copyright 2020 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.13)

# Allow benchmark to be built as a standalone library.
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
    set(CMAKE_TOOLCHAIN_FILE toolchain-gcc CACHE STRING "Toolchain to use")

    project(Hwpe LANGUAGES C ASM)
    include(SnitchUtilities)

    add_compile_options(-O3 -g -ffunction-sections)

    # Build the runtime.
    add_subdirectory(../snRuntime snRuntime)
endif()

# INCLUDES
include_directories(include)
include_directories(${SNRUNTIME_INCLUDE_DIRS})

# LIBRARIES
add_library(hwpe_lib src/hwpe_snitch_redmule_hal.c src/utils.c)

# EXECUTABLES
add_snitch_executable(hwpe_config tests/redmule_config.c)
add_snitch_executable(hwpe_run tests/redmule_test.c)

# LINKS
target_link_libraries(hwpe_lib ${SNITCH_RUNTIME})
target_link_libraries(hwpe_run hwpe_lib ${SNITCH_RUNTIME})
target_link_libraries(hwpe_config hwpe_lib ${SNITCH_RUNTIME})
