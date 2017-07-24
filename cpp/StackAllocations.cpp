#include <iostream>

//Not working
int main(int argc, char **argv){
    for(int i = 0; i < 42; i++){
        int foo[i];
        for(int j = 0; j < i; j++){
            std::cout << i << std::endl;
        }
    }

    return 0;
}
