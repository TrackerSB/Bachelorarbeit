#include <iostream>
#include <stdlib.h>

//Working?
int main(int argc, char **argv){
    int array[42];
    __int64_t foo = rand() % 42;
    int *bar = (int *) foo;
    std::cout << *(array + (__int64_t) bar) << std::endl;

    return 0;
}
