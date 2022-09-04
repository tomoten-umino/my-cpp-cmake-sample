# find command cpplint
find_program(CPP_LINT cpplint)

# add make command
add_custom_target(
    cpplint
    COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
            ${CPP_LINT} --filter=-legal/copyright
            `git diff --name-only`
)
