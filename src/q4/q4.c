#include <stdio.h>

long max_min(long* arr, long n);
// {
    // long max = arr[0];
    // long min = arr[0];

    // for (long i = 1; i < n; i++)
    // {
    //     if (arr[i] > max)
    //     {
    //         max = arr[i];
    //     }
    //     if (arr[i] < min)
    //     {
    //         min = arr[i];
    //     }
    // }

    // return max - min;
// }

int main()
{
    long n;
    scanf("%ld", &n);

    long arr[n];
    for (long i = 0; i < n; i++)
    {
        scanf("%ld", &arr[i]);
    }

    printf("%ld\n", max_min(arr, n));

    return 0;
}