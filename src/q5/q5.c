#include <stdio.h>

void mularr(long* arr, long n);
// {
//     long prod = 1;
//     long zero_count = 0;

//     for (long i = 0; i < n; i++)
//     {
//         if (arr[i] == 0)
//             zero_count++;
//         else
//             prod *= arr[i];
//     }

//     for (long i = 0; i < n; i++)
//     {
//         if (zero_count > 1)
//             arr[i] = 0;
//         else if (zero_count == 1)
//             arr[i] = (arr[i] == 0) ? prod : 0;
//         else
//             arr[i] = prod / arr[i];
//     }
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

    mularr(arr, n);

    for (long i = 0; i < n; i++)
    {
        printf("%ld ", arr[i]);
    }
    
    printf("\n");
    return 0;
}