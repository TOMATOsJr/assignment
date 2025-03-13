.global palindrome

palindrome: # %r8 = i, %r9 = j
    movq $0, %r8 # i = 0
    leaq -1(%rsi), %r9 # j = n-1

L2: #for loop
    cmpq %r9, %r8
    jge L3 # break when i>=j

    # if arr[i]!=arr[j]
    movzbl (%rdi,%r9), %edx
    movzbl (%rdi,%r8), %eax

    cmpb %dl, %al
    jne L4 # arr[i] ! = arr[j]

    incq %r8
    decq %r9
    jmp L2

L4: # if arr[i]!=arr[j]
    movq $0, %rax # for loop terminated so no palindrome
    ret

L3:
    movq $1, %rax # for loop complete hence palindrome
    ret
