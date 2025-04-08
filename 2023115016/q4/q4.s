.global majority

majority: # %rdi = arr, %rsi = n
    movq (%rdi), %rax # candidate = arr[0]
    movq $1, %r9 # count = 1
    movq $1, %r10 # i = 1

L2: # for loop
    cmpq %rsi, %r10 # check i < n
    jge L3 # break condition i >= n

    cmpq %rax, (%rdi,%r10,8) # check arr[i] == candidate
    jne L5

L4: # if arr[i] == candidate
    incq %r9 # count++
    jmp L6

L5: # else
    decq %r9 # count--

L6: # if count == 0
    cmpq $0, %r9
    jne L7 # if count != 0 continue
    movq (%rdi,%r10,8), %rax # candidate = arr[i]
    movq $1, %r9 # count = 1

L7: # for loop update
    incq %r10 # i++
    jmp L2

L3: # return %rax
    ret
