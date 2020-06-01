cmake_minimum_required (VERSION 3.10)

project (LEAPQ)
# CMakeLists files in this project can refer to the root source directory
# of the project as ${LEAPQ_SOURCE_DIR} and to the root binary directory
# of the project as ${LEAPQ_BINARY_DIR}.

# Requires C++17.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler options.
set(LEAPQ_M_CFLAGS "-mpopcnt -mfma -march=native")
set(LEAPQ_COMMON_CXX_FLAGS "${LEAPQ_M_CFLAGS} -Werror -Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LEAPQ_COMMON_CXX_FLAGS}")

# Install inside the build directory.
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install)

include(external.cmake)

include_directories(.)
ExternalProject_Get_Property(vx BINARY_DIR)
MESSAGE(STATUS "VX_BINARY_DIR:        " ${BINARY_DIR})
include_directories(${BINARY_DIR}/install/include)

include(lq/leapquantum.cmake)
#include(test/test.cmake)
#include(doc/doc.cmake)


# Log CMake variables.
MESSAGE(STATUS "CMAKE_CXX_COMPILER:   " ${CMAKE_CXX_COMPILER})
MESSAGE(STATUS "CMAKE_CXX_FLAGS:      " ${CMAKE_CXX_FLAGS})
MESSAGE(STATUS "CMAKE_INSTALL_PREFIX: " ${CMAKE_INSTALL_PREFIX})

