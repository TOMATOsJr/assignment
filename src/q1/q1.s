.global one_time

one_time: # %rax = ones, %rbx = twos, %r10 = i
    movq $0, %rax # ones=0
    movq $0, %rbx # twos=0
    movq $0, %r10 # i=0

L2: #for loop
    cmpq %rsi, %r10
    jge L3 # break cond'n i >= size

    # ones = (ones ^ arr[i]) & ~twos
    xorq (%rdi,%r10,8), %rax # ones= ones^arr[i]
    notq %rbx #twos=~twos
    andq %rbx, %rax # ones = ones & ~twos
    notq %rbx #restore twos

    # twos = (twos ^ arr[i]) & ~ones
    xorq (%rdi,%r10,8), %rbx # twos= twos^arr[i]
    notq %rax #ones=~ones
    andq %rax, %rbx # twos = twos & ~ones
    notq %rax #restore ones

    incq %r10 # i++
    jmp L2

L3:
    ret
