    .global _start
    .text
_start:
    movl $80155, %eax
    movl $10644, %ebx

    /* exit program*/
    movq $60, %rax 
    xor %rdi, %rdi
    syscall
