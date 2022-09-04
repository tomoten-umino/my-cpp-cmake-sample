#include "mylib/mylib.hpp"

int main(int argc, char* argv[]) {
    Mylib* hoge = nullptr;
    hoge = new Mylib();
    hoge->hello();  // Hello world!

    delete hoge;
    hoge = nullptr;

    return 0;
}
