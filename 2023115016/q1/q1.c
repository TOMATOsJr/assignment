#include <stdio.h>

// Function to count zero-sum subarrays
long ZeroSubarrays(long* arr, long n);
// {
//     long zeroSumCount = 0;

//     // Iterate through all subarrays
//     for (long i = 0; i < n; i++) {
//         long cumulativeSum = 0;
//         for (long j = i; j < n; j++) {
//             cumulativeSum += arr[j];
//             if (cumulativeSum == 0) {
//                 zeroSumCount++;
//             }
//         }
//     }

//     return zeroSumCount;
// }

// Main function for testing
int main()
{
    long n;
    scanf("%ld", &n);
    long arr[n];
    for (long i = 0; i < n; i++) {
        scanf("%ld", &arr[i]);
    }
    // Count and print the number of zero-sum subarrays
    printf("%ld\n", ZeroSubarrays(arr, n));
    return 0;
}
