#include <stdlib.h>

int main(int argc, char **argv){
    int A[1000][1000];
    int B[1000][1000];
    int C[1000][1000];

    for(int r = 0; r < 1000; r++){
        for(int c = 0; c < 1000; c++){
            A[r][c] = B[r][c] = r * c;
        }
        A[r][0] += rand() % 1000;
    }

    for(int r = 0; r < 1000; r++){
        for(int c = 0; c < 1000; c++){
            C[r][c] = rand() % 1000;
            for(int t = 0; t < 1000; t++){
                C[r][c] += A[r][t] * B[t][c];
            }
        }
    }

    return 0;
}
