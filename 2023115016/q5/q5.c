#include <stdio.h>

short peak(short* arr, int n);
// {
//     int left = 0;
//     int right = n - 1;

//     while (left < right)
//     {
//         int mid = left + (right - left) / 2;

//         if (arr[mid] < arr[mid + 1])
//         {
//             left = mid + 1;
//         }
//         else
//         {
//             right = mid;
//         }
//     }

//     return arr[left];
// }

int main()
{
    int n;
    scanf("%d", &n);

    short arr[n];
    for (int i = 0; i < n; i++)
    {
        scanf("%hd", &arr[i]);
    }

    short peakVal = peak(arr, n);
    printf("%hd\n", peakVal);

    return 0;
}