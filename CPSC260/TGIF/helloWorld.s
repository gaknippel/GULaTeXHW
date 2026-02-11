.global _start
.text
_start:
        movq    $1, %rax ##system call 1 is write
        movq    $1, %rdi ## file handle 1 is stdout
        movq    $message, %rsi ##moves address of the string to output
        movq    $13, %rdx 
        syscall

        # this is how you exit gracefully
        movq    $60, %rax
        xor     %rdi, %rdi
        syscall


message: .ascii "Hello World!\n"