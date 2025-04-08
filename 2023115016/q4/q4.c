#include <stdio.h>

long majority(long* arr, long n);
// {
//     long candidate = arr[0]
//     long count = 1;

//     for (long i = 1; i < n; i++)
//     {
//         if (arr[i] == candidate)
//         {
//             count++;
//         }
//         else
//         {
//             count--;
//         }

//         if (count == 0)
//         {
//             candidate = arr[i];
//             count = 1;
//         }
//     }

//     return candidate;
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

    long ans = majority(arr, n);
    printf("%ld\n", ans);

    return 0;
}