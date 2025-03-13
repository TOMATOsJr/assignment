#include<stdio.h>

void mov_arr2(long* arr, long n);
// {
//     if(n<2)
//      return
//     long i1 = arr[n-2];
//     long i2 = arr[n-1];

//     for(long i = n-1; i>1; i--)
//     {
//         arr[i] = arr[i-2];
//     }
//     arr[0] = i1;
//     arr[1] = i2;
// }

int main()
{
    long n;
    scanf("%ld", &n);

    long arr[n];

    for(long i = 0; i<n; i++)
    {
        scanf("%ld", &arr[i]);
    }

    mov_arr2(arr, n);

    for(long i = 0; i<n; i++)
    {
        printf("%ld ", arr[i]);
    }
    printf("\n");
    return 0;
}