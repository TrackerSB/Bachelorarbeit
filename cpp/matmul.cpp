#include <stdlib.h>

#define N 1000

int A[N][N];
int B[N][N];
int C[N][N];

int main(int argc, char **argv){
    for(int r = 0; r < N; r++){
        for(int c = 0; c < N; c++){
            A[r][c] = B[r][c] = r * c;
        }
        A[r][0] += rand() % N;
    }

    for(int r = 0; r < N; r++){
        for(int c = 0; c < N; c++){
            C[r][c] = rand() % N;
            for(int t = 0; t < N; t++){
                C[r][c] += A[r][t] * B[t][c];
            }
        }
    }

    return 0;
}
