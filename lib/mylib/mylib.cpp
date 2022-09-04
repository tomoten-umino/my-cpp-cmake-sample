// test4
#include "mylib/mylib.hpp"
#include <iostream>

void Mylib::hello() {
    std::cout << "Hello world!" << std::endl;
}

void Mylib::nested_hello() {
    // dummy val
    std::string tmp1("tmp1");
    std::string tmp2("tmp2");

    if ( tmp1 == "tmp1" ) {
        if ( tmp2 == "tmp2" ) {
            std::cout << "Hello world!" << std::endl;
        }
    }
}

void Mylib::deep_nested_hello() {
    // dummy val
    std::string tmp1("tmp1");
    std::string tmp2("tmp2");
    std::string tmp3("tmp3");
    std::string tmp4("tmp4");

    if ( tmp1 == "tmp1" ) {
        if ( tmp2 == "tmp2" ) {
            if ( tmp3 == "tmp3" ) {
                if ( tmp4 == "tmp4" ) {
                    std::cout << "Hello world!" << std::endl;
                }
            }
        }
    }
}
