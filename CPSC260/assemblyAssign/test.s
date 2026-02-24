.global _start
.text
_start:

        movabsq $0x0011223344556677, %rax
        movb $-1, %al
        movw    $-1, %ax
        movl    $-1, %eax
        movq    $-1, %rax


        movq    $60, %rax
        xor     %rdi, %rdi
        syscall
        