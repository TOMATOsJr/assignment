.global higherMarks

# %rdi = marks, %rsi = n, %rdx = result, %r9 = stack.size = top
higherMarks: # stack is cpu stack and %rsp = stack top
    movq $0, %r8 # i = 0
    movq $-1, %r9 # top = -1 =>empty

L2: # i for loop
    cmpq %rsi, %r8
    jge L6 # break cond'n i >= n
    jmp L5 # enter while loop

L4: # while loop logic
    movq (%rdi,%r8,8), %r10 # load marks[i]
    movq (%rsp), %r12 # load top index from the stack
    movq %r10, (%rdx,%r12,8) # store marks[i] in result[stack[top]]
    popq %rax # pop index
    decq %r9 # top--

L5: # while loop condition
    cmpq $-1, %r9 # top != -1 checking
    je L8 # if top == -1 end while loop
    movq (%rdi,%r8,8), %r10 # load marks[i]
    movq (%rsp), %r12 # load top index from the stack
    movq (%rdi,%r12,8), %r11 # load marks[stack[top]]
    cmpq %r11, %r10 # if then marks[i] > marks[stack[top]] implement logic
    jg L4

L8: # for loop continued
    pushq %r8 # push index i
    incq %r9 # top++
    incq %r8 # i++
    jmp L2

L6: # while loop2 logic
    movq (%rsp), %r12 # load top index from the stack
    movq $-1, (%rdx,%r12,8) # store -1 in result[stack[top]]
    popq %rax
    decq %r9 # top--

L7: # while loop 2 cond'n
    cmpq $-1, %r9
    jne L6

end:
    ret
