#include <stdlib.h>

int main(int argc, char **argv){
A:
    if(std::rand() % 10 > 5)
        goto B;
    else
        goto C;
B:
    if(std::rand() > 5)
        goto C;
    else
        goto D;
C:
    if(std::rand() > 5)
        goto B;
    else
        goto D;
D:

    return 0;
}
