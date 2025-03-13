.global mularr

mularr: # %rax = prod, %r8 = zero_count, %r9 = i
    movq $1, %rax # prod = 1
    movq $0, %r8 # zero_count = 0
    movq $0, %r9 # i = 0

L2: #first for loop
    cmpq %rsi, %r9
    jge L3 # break cond'n i >= n

    #if arr[i] != 0
    cmpq $0, (%rdi,%r9,8)
    je L5

L4: #else
    imulq (%rdi,%r9,8)
    jmp L6

L5: # if arr[i] == 0
    incq %r8

L6:
    incq %r9
    jmp L2

L3: # second loop initialise
    movq $0, %r9 # i = 0

L7: #second loop
    cmpq %rsi, %r9
    jge L8 # break cond'n i >= n

    #if zero_count > 1
    cmpq $1, %r8 
    jg L11

    # else if zero_count == 1
    cmpq $1, %r8
    je L10

    # else
    movq (%rdi,%r9,8), %rcx
    idivq %rcx # prod/=arr[i]
    movq %rax, (%rdi,%r9,8) # arr[i]=prod (prod/arr[i])
    imulq %rcx #restore prod
    jmp L9

L10: # else if zero_count == 1
    movq (%rdi,%r9,8), %rcx # store arr[i] before change
    movq $0, (%rdi,%r9,8) # arr[i] = 0
    cmpq $0, %rcx
    je L12
    jmp L9

L12: # if was arr[i]==0 then arr[i] = prod
    movq %rax, (%rdi,%r9,8)
    jmp L9

L11: # if zero_count >1
    movq $0, (%rdi,%r9,8)

L9:
    incq %r9
    jmp L7

L8:
    ret
