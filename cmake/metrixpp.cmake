# find command metrix++
find_program(METRIXPP metrix++)

# add make command
add_custom_target(
    metrixpp
    # analysis
    COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
            ${METRIXPP} collect --log-level=WARNING
                                --std.code.lines.code 
                                --std.code.complexity.maxindent
                                --std.code.complexity.cyclomatic
                                --exclude-files=CMakeCXXCompilerId.cpp
                                --db-file=${PROJECT_BINARY_DIR}/metrixpp.db
    # export from db to csv
    COMMAND ${METRIXPP} export --db-file=./metrixpp.db > metrics-result.csv
    # check max indent
    COMMAND ${METRIXPP} limit --log-level=WARNING --db-file=metrixpp.db --max-limit=std.code.complexity:maxindent:4 | tee max_indent_error.txt
    # check max cyclomatic 
    COMMAND ${METRIXPP} limit --log-level=WARNING --db-file=metrixpp.db --max-limit=std.code.complexity:cyclomatic:10 | tee max_cyclomatic_error.txt
)
