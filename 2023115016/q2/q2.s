.global binomialCoeff

binomialCoeff: # %rdi = n, %rsi = r
    pushq %rbx # r value in rbx
    pushq %r12 # n value in r12
    movq %rsi, %rbx # putting r into %rbx
    movq %rdi, %r12 # putting n into %r12

    movq $1, %rax
    cmpq $0, %rsi # if r == 1 then return 1
    je L2
    decq %rsi
    call binomialCoeff # computes binomialCoeff(n,r-1)
    subq %rbx, %r12 # n-r
    incq %r12 # n-r+1
    imulq %r12 # (n-r+1*binomialCoeff(n,r-1))
    idivq %rbx # (n-r+1*binomialCoeff(n,r-1))/r

L2:
    popq %r12
    popq %rbx
    ret
