#include <stdio.h>
int isOpposite(int x, int y) {
    return !(x+y);
}

int is8x(int x) {

    return !(x&7);
}

int isPositive(int x) {
    return !((x>>31) | (!x));
}

int isGE2n(int x, int n) {
    int value = (1<<n);
    value = x + ~(value) + 1;
    int value_x = (value>>31);
    return !value_x;
}
int main()
{
    int score = 0;
    //2.1
    printf("\n2.1 isOpposite");
    if (isOpposite(2, -2) == 1 && isOpposite(5, -1) == 0 && isOpposite(0, 16) == 0 && isOpposite(-4, 4) == 1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.2
    printf("\n2.2 is8x");
    if (is8x(16) == 1 && is8x(23) == 0 && is8x(0) == 1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.3
    printf("\n2.3 isPositive");
    if (isPositive(16) == 1 && isPositive(0) == 0 && isPositive(-8) == 0)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    //2.4
    printf("\n2.4 isGE2n");
    if (isGE2n(12, 4) == 0 && isGE2n(8, 3) == 1 && isGE2n(15, 2) == 1)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    printf("\n------\nYour score: %.1f", (float)score / 2);
    return 0;
}

