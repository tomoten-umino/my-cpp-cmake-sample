# 動作確認できたCMakeのバージョン
cmake_minimum_required(VERSION 3.13)

# プロジェクトの情報
project(mylib
    VERSION 1.0
    DESCRIPTION "mylib project"
    LANGUAGES CXX
)

# in-source ビルドガード
if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there. You may need to remove CMakeCache.txt. ")
endif()

# 以下のフォルダにあるCMakeLists.txtも読み込んでビルドターゲットを生成する
add_subdirectory(lib/mylib)
add_subdirectory(examples EXCLUDE_FROM_ALL)