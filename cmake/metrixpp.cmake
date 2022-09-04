# find command metrix++
find_program(METRIXPP metrix++)

# add make command
add_custom_target(
    metrixpp
    # analysis
    COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} &&
            ${METRIXPP} collect --std.code.lines.code 
                                --std.code.complexity.maxindent
                                --std.code.complexity.cyclomatic
                                --db-file=${PROJECT_BINARY_DIR}/metrixpp.db
                                `git diff --name-only`
    # export from db to csv
    COMMAND ${METRIXPP} export --db-file=./metrixpp.db > metrics-result.csv
    # check max indent
    COMMAND ${METRIXPP} limit --log-level=ERROR --db-file=metrixpp.db --max-limit=std.code.complexity:maxindent:4 | tee max_indent_error.txt
    # check max cyclomatic 
    COMMAND ${METRIXPP} limit --log-level=ERROR --db-file=metrixpp.db --max-limit=std.code.complexity:cyclomatic:10 | tee max_cyclomatic_error.txt
)
