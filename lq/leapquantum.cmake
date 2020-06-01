
# use RPATH, i.e. don't skip the full RPATH for the build tree
set(CMAKE_SKIP_BUILD_RPATH FALSE)

#set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

# add the automatically determined parts of the RPATH
# which point to directories outside the build tree to the install RPATH
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)


set(LEAPQ_SOURCES
    lq/main.cpp
)

add_executable(leapq ${LEAPQ_SOURCES})
add_dependencies(leapq vx)
target_compile_options(leapq PUBLIC -O3 -flto -DNDEBUG)

add_executable(leapq-dbg ${LEAPQ_SOURCES})
target_compile_options(leapq-dbg PUBLIC -O2 -g)
#target_compile_definitions(leapq-dbg PUBLIC ENABLE_???_ASSERT)



add_library(leapq_interface_libs INTERFACE)
target_link_libraries(leapq_interface_libs
    #INTERFACE ${???_INSTALL_DIR}/lib/libXXX.so
    #INTERFACE -pthread
)

target_link_libraries(leapq       PUBLIC leapq_interface_libs)
target_link_libraries(leapq-dbg   PUBLIC leapq_interface_libs)

install(TARGETS leapq leapq-dbg  DESTINATION bin)
