.global max_min

# %rax = max, %rbx = min, %rdx = i, %rdi = arr, %rsi = n
max_min:
    movq (%rdi), %rax # max = arr[0]
    movq (%rdi), %rbx # min = arr[0]
    movq $1, %rdx # initialise iterator i to 1

L2: # for loop
    cmpq %rsi, %rdx
    jge L3 # i >= n break cond'n for loop

    # if arr[i] > max
    cmpq %rax, (%rdi,%rdx,8) # arr + 8*i = arr[i]
    jg L4

L6: # if arr[i] < min
    cmpq %rbx, (%rdi,%rdx,8) # arr + 8*i = arr[i]
    jl L5

L7:
    incq %rdx # i++
    jmp L2

L4: # if arr[i] > max
    movq (%rdi,%rdx,8), %rax # max = arr[i]
    jmp L6

L5: # if arr[i] < min
    movq (%rdi,%rdx,8), %rbx # min = arr[i]
    jmp L7

L3: # after for loop
    subq %rbx, %rax # max - min
    ret
