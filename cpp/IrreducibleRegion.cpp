void foo(int a, int b) {
    if(b == 42) {
        if (a > 0) {
LABEL1:
            a--;
        }

        if (a > 0) {
            goto LABEL1;
        }
        b = b + 42;
    }
}
