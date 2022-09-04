# find command metrix++
find_program(METRIXPP metrix++)

# add make command
add_custom_target(
    metrixpp
    COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
            ${METRIXPP} collect --std.code.lines.code 
                                --std.code.complexity.maxindent
                                --std.code.complexity.cyclomatic
                                --exclude-files=CMakeCXXCompilerId.cpp
                                --db-file=${PROJECT_BINARY_DIR}/metrixpp.db
    COMMAND ${METRIXPP} export --db-file=./metrixpp.db > metrics-result.csv
)
