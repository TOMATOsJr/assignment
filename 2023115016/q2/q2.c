#include <stdio.h>

long binomialCoeff(long n, long r);
// {
//     // Base case
//     if (r == 0)
//         return 1;

//     // Use multiplicative formula: C(n,r) = C(n,r-1) * (n-r+1)/r
//     return (n - r + 1) * binomialCoeff(n, r - 1) / r;
// }

int main()
{
    long n, r;
    scanf("%ld %ld", &n, &r);

    long result = binomialCoeff(n, r);
    printf("%ld\n", result);

    return 0;
}