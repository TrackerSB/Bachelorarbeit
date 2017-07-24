#include <iostream>

int main(int argc, char **argv){
    __int64_t foo = 42;

    for(int i = 0; i < 42; i++){
        int *bar = (int *) foo;
        for(int j = 0; j < 42; j++){
            std::cout << *bar << std::endl;
        }
    }

    return 0;
}
