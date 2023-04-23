# option: shared library or static library default=OFF
option(MYLIB_BUILD_SHARED_LIBS "build mylib as a shared library" OFF)

if (MYLIB_BUILD_SHARED_LIBS)
    add_library(mylib SHARED)
else()
    add_library(mylib STATIC)
endif()

# source files for mylib
target_sources(mylib
    PRIVATE
    ${MYLIB_SOURCE}
)

# include directories
target_include_directories(mylib
    PUBLIC 
    ${MY_INCLUDE_PATH}
)

# include GNU Directories
include(GNUInstallDirs)

# install mylib library
install(TARGETS mylib
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# install headers
install(
    DIRECTORY ${MY_INCLUDE_PATH}
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    FILES_MATCHING PATTERN "*.hpp"
)
