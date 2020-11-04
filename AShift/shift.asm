;Patricia Ong
;CPSC 240-1 Midterm Program

extern scanf
extern printf
;------------------------------------------------------------------------------------------------
global shift
;------------------------------------------------------------------------------------------------
section .data               ;Place initialized data here
    
    shiftofArray db "The values in the array have been shifted.", 10, 0

    stringFormat db "%s", 0         ;General String Format
    intFormat db "%ld", 10, 0       ;General Decimal Integer

section .bss

section .text

shift:

    ;16 Pushes
    push rbp
    mov rbp, rsp 
    push rdi 
    push rsi
    push rdx 
    push rcx
    push r8 
    push r9 
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    push rbx
    ;pushf
    ;push rax
; ---------------------------------------------------------------------------------------------

mov r15, rdi        ;Actual Array
mov r14, rsi        ;Size of the Array

mov r13, r14        ;Count = -1
dec r13

mov r11, r14       ;Current count

jmp begin_shift

next_loop:          ;For the next_loop
dec r11
dec r13

begin_shift:
cmp r13, -1         ;If the current position is equal to the size of the array.
je end              ;If it is true, then it is done.

mov r8, [r15 + 8 * r13]
mov [r15 + 8 * r11], r8     ;Array from before is moved.

jmp next_loop
end:
mov r8, -1
mov [r15], r8


mov rax, 0                  ;Place 0 to rax.
mov rdi, r15                ;Place the array to rdi.

inc r14                     ;
mov rsi, r14

;Print shiftofArray
mov qword rax, 0    
mov rdi, stringFormat       ; "%s"
mov rsi, shiftofArray       ;"The values in the array have been shifted."
call printf                 ;Call extern printf function


; ---------------------------------------------------------------------------------------------
    ;16 pops
    ;pop rax
    ;popf
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    pop rbp 

    ret