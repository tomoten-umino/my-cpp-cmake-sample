# add coverage option
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} --coverage")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")

# Generate executable file
add_executable(unit-test
  ${CMAKE_CURRENT_SOURCE_DIR}/unit-test.cpp
)

# add test targets
target_sources(unit-test
  PRIVATE
  ${MYLIB_SOURCE}
)
target_include_directories(unit-test
  PUBLIC
  ${GTEST_INCLUDE_PATH}
  ${GMOCK_INCLUDE_PATH}
  ${MY_INCLUDE_PATH}
)
target_link_libraries(unit-test
  gtest
  gtest_main
  pthread
)

# add make command
add_custom_target(
  run-test
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/unit-test
)
