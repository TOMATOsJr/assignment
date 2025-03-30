#include <stdio.h>
#include <stdlib.h>

// Function to find the next higher marks for each element
void higherMarks(long* marks, long n, long* result);
// {
//     long stack[n], top = -1; // Stack to store indices and its top pointer

//     // Iterate through the array
//     for (long i = 0; i < n; i++) {
//         // While stack is not empty and current element is greater than
//         // the element at the index stored at the top of the stack
//         while (top != -1 && marks[i] > marks[stack[top]]) {
//             // Set the result for the element at the top of the stack
//             result[stack[top--]] = marks[i];
//         }
//         // Push the current index onto the stack
//         stack[++top] = i;
//     }

//     // For remaining elements in the stack (no greater element to the right)
//     while (top != -1) {
//         result[stack[top--]] = -1; // Set result to -1
//     }
// }

int main()
{
    long n;
    // Read the number of elements
    scanf("%ld", &n);

    long marks[n], result[n];
    // Read the marks for each question
    for (long i = 0; i < n; i++) {
        scanf("%ld", &marks[i]);
    }

    // Find the next higher marks for each question
    higherMarks(marks, n, result);

    // Print the result array
    for (long i = 0; i < n; i++) {
        printf("%ld ", result[i]);
    }
    printf("\n");

    return 0;
}