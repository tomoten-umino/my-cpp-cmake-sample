add_custom_target(examples)
add_dependencies(examples
    main
)

add_executable(main main.cpp)
target_link_libraries(main
    mylib
)