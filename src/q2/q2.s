.global mov_arr2

mov_arr2: # arr in %rdi and n in %rsi
    cmpq $2, %rsi # if array size < 2 end
    jl end

    movq -16(%rdi,%rsi,8), %r8 # i1=arr[n-2]
    movq -8(%rdi,%rsi,8), %r9 # i2=arr[n-1]
    leaq -1(%rsi), %rdx #store iterator rdx intialise to n-1

L2:
    cmpq $1, %rdx # rdx > 1
    jle L3 # run till rdx > 1

    movq -16(%rdi,%rdx,8), %rbx # store arr[i-2]
    movq %rbx, (%rdi,%rdx,8) # i # arr[i] = arr[i-2]
    decq %rdx # reduce iterator in each cycle
    jmp L2

L3:
    movq %r8, (%rdi) #arr[0] = arr[n-2]
    movq %r9, 8(%rdi) #arr[1] = arr[n-1]
    movq %rdi, %rax

end:
    ret
