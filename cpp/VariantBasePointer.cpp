struct b {
    double **b;
};

void a(struct b *A) {
    for (int i=0; i<32; i++)
        A[i].b[i] = 0;
}
