# my-cpp-cmake-sample

This repository is a sample project of C++ program.

## Reference

- This project uses cmake and the CMakeLists.txt is created according to the following page.
  - [C/C++プロジェクトをCMakeでビルドする](https://qiita.com/Hiroya_W/items/049bfb4c6ad3dfe6ff0c)

## Dependency

- This project uses the following OSS tools.
  - cmake
  - gcc, g++
  - VS code
    - plugin: ms-vscode-remote.remote-containers
  - docker ( devcontainer )

## Usage

### Directory structure

```shell
my-cpp-cmake-sample
├── CMakeLists.txt
├── LICENSE
├── README.md
├── examples
│   ├── CMakeLists.txt
│   └── main.cpp
├── include
│   └── mylib
│       └── mylib.hpp
└── lib
    └── mylib
        ├── CMakeLists.txt
        └── mylib.cpp
```

### Setup devcontainer

- Clone this repository and run VS code in the root directory.

```shell
git clone https://github.com/tomoten-umino/my-cpp-cmake-sample.git
cd my-cpp-cmake-sample
code .
```

- Use "Reopen in Container" and start devcontainer with a new window.

### Build project

※You have to execute the following commands in devcontainer.

```shell
mkdir build
cd build
cmake ..
# build lib
make
# build examples
make examples
# clean
make clean
# install
make install
```

### cmake options

- We can set the following options.

```shell
(example)
$ cmake .. -DCMAKE_INSTALL_PREFIX='$HOME/.local' ・・・・・・
```

| option | description |
| --- | --- |
| -DCMAKE_INSTALL_PREFIX | install directory |
| -DMYLIB_BUILD_SHARED_LIBS | ON : build lib as a shared library <br> OFF : (default) build lib as a static library |
| -DCMAKE_C_COMPILER | set c compiler |
| -DCMAKE_CXX_COMPILER | set c++ compiler
| -DCMAKE_BUILD_TYPE | Debug : set -g option <br> Release : set O3 optimization |

If you want to know other usage, please see [C/C++プロジェクトをCMakeでビルドする](https://qiita.com/Hiroya_W/items/049bfb4c6ad3dfe6ff0c).

## License

This sample repository is licensed under WTFPL license. See the [LICENSE](/LICENSE) for more information.
