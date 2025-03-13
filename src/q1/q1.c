#include <stdio.h>

long one_time(long* arr, long size);
// {
//     long ones = 0, twos = 0;
//     for (long i = 0; i < size; i++) {
//         ones = (ones ^ arr[i]) & ~twos;
//         twos = (twos ^ arr[i]) & ~ones;
//     }
//     return ones;
// }

int main() {
    long n;
    scanf("%ld", &n);

    long size = 3 * n + 1;
    long arr[size];

    for (long i = 0; i < size; i++) {
        scanf("%ld", &arr[i]);
    }

    printf("%ld\n", one_time(arr, size));

    return 0;
}
