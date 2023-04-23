#include "mylib/mylib.hpp"
#include "gtest/gtest.h"

int main(int argc, char* argv[]) {
    // initialize Google Test
    ::testing::InitGoogleTest(&argc, argv);


    return RUN_ALL_TESTS();
}

TEST(SumTest, Value){

    // create instance
    Mylib* hoge = nullptr;
    hoge = new Mylib();

    // case 1
    EXPECT_EQ(2, hoge->my_sum(1, 1));

    delete hoge;
    hoge = nullptr;
}