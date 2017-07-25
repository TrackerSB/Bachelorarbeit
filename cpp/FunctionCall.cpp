#define N 1024
double invalidCall(double A[N]);

void a(double A[N], int n) {
    for(int i = 0; i < n; i++) {
        A[i] = invalidCall(A);
    }
}
