.global peak 

peak: 
    movq $0, %r8 # left = 0
    movl %esi, %r9d # right = n
    decl %r9d # right = n - 1

L2: # while loop
    movl %r9d, %r10d # mid = right sign-extended
    subl %r8d, %r10d # mid = right - left
    sarl $1, %r10d # mid = (right-left)/2
    addl %r8d, %r10d # mid = left + (right - left) / 2

    movw 2(%rdi,%r10,2), %r11w # reusing %r11 to store arr[mid+1]
    cmpw %r11w, (%rdi,%r10,2) 
    jge L5 # check for arr[mid] < arr[mid+1] 

L4: # if arr[mid] < arr[mid+1]
    movl %r10d, %r8d # left = mid
    incl %r8d # left = mid + 1
    jmp L3

L5: # else
    movl %r10d, %r9d # right = mid

L3: # loop condition
    cmpl %r9d, %r8d # check left < right
    jl L2

end:
    movw (%rdi,%r8,2), %ax # %rax = arr[left]
    ret
