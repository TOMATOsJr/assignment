.global ZeroSubarrays

ZeroSubarrays: # rdi = arr, rsi = n, rax = count
    movq $0, %rax # count = 0
    movq $0, %r8 # i = 0

L2: # i for loop
    cmpq %rsi, %r8
    jge L3 # break if i >= n

    movq $0, %rdx # sum = 0
    movq %r8, %r9 # j = i
    jmp L4

L4: # j for loop
    cmpq %rsi, %r9
    jge L5 # break if j >= n

    addq (%rdi,%r9,8), %rdx # sum += arr[j]

    cmpq $0, %rdx
    je L6

L7: # j loop after if cond'n
    incq %r9
    jmp L4

L6: # if sum == 0
    incq %rax # count++
    jmp L7

L5: # after innerloop ends iterate i for loop again
    incq %r8 # i++
    jmp L2

L3:
    ret
