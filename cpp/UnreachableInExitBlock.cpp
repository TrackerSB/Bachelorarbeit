void f(long A[], long N) {
    long i;
    for (i = 0; i < N; ++i)
        A[i] = i;
    unreachable()
}
