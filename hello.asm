;--------------------------------------------
; Hello world in assembly
; 
; nasm -felf64 hello.asm && ld hello.o && ./a.out
;
;--------------------------------------------

global main

; Data section
section .data
message:  db      "Hello, World", 0xA ; newline character
len:      equ     $ - message

section .text
main:   
          xor ebx, ebx          ; set to 0
loop:                           ; start of loop
          mov eax, 1            ; syscall for write
          mov edi, 1            ; file handle is 1 for stdout
          mov esi, message      ; set esi to address of message
          mov edx, len          ; number of bytes to write
          syscall               ; invoke os to write
          inc ebx               ; ecx++
          cmp ebx, 5            ; compare ecx to 5
          jl  loop              ; if ecx < 5, loop
          mov eax, 60           ; syscall for exit
          xor edi, edi          ; exit code 0
          syscall               ; invoke os to exit

