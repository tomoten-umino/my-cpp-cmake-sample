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


