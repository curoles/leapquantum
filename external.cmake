#https://cmake.org/cmake/help/latest/module/ExternalProject.html

include(ExternalProject)

ExternalProject_Add(vx
  PREFIX            vx
  GIT_REPOSITORY    https://github.com/curoles/vecinsn.git
  GIT_TAG           origin/master
  GIT_SHALLOW       TRUE
  UPDATE_COMMAND    "" # do not check for updates
)

#ExternalProject_Add(cli
#  DOWNLOAD_COMMAND wget -q https://github.com/CLIUtils/CLI11/releases/download/v1.9.0/CLI11.hpp
#)
