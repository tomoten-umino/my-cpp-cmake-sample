# search c++ files
file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.hpp *.c *.h)
foreach (SOURCE_FILE ${ALL_SOURCE_FILES})
    string(FIND ${SOURCE_FILE} ${PROJECT_BINARY_DIR} PROJECT_TRDPARTY_DIR_FOUND)
    if (NOT ${PROJECT_TRDPARTY_DIR_FOUND} EQUAL -1)
        list(REMOVE_ITEM ALL_SOURCE_FILES ${SOURCE_FILE})
    endif ()
endforeach ()

# find command cpplint
find_program(CPP_LINT cpplint)

# add make command
add_custom_target(
    cpplint
    COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
            ${CPP_LINT} --filter=-legal/copyright
            ${ALL_SOURCE_FILES}
)
