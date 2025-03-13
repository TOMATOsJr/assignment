#include <stdio.h>
#include <stdlib.h>

long palindrome(char* arr, long n);
// {
//     for(long i = 0, j=n-1; i < j; i++, j--)
//     {
//         if(arr[i] != arr[j])
//         {
//             return 0;
//         }
//     }
//     return 1;
// }

int main()
{
    char* arr = NULL;
    char ch;
    long size = 0, capacity = 1;

    arr = malloc(capacity * sizeof(char));

    while ((ch = getchar()) != '\n')
    {
        if (size + 1 >= capacity)
        {
            capacity++;
            arr = realloc(arr, capacity * sizeof(char));
        }
        arr[size++] = ch;
    }

    printf("%ld\n", palindrome(arr, size));

    return 0;
}