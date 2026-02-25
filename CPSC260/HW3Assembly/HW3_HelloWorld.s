.global _start
.text
_start:

        movq    $1, %rax
        movq    $1, %rdi
        movq    $message, %rsi
        movq    $45, %rdx
        syscall

        movq    $60, %rax
        xor     %rdi, %rdi
        syscall
message: .ascii "assembly is like learning how to walk again!\n"
