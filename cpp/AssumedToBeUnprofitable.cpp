void onlyWrite(float *A) {
    for (long i = 0; i < 100; i++)
        A[i] = 0;
}

void onlyRead(float *A) {
    for (long i = 0; i < 100; i++)
        A[i];
}
