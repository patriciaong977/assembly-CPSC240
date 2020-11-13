;============================================================================================================
; Program name: circle. 
;               This program calculates the circumference of a circle.
;              
; File: circle.asm
; File Description: Finding the circumference of a circle with xmm registers. 
; Author: Patricia Ong
; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
;
; Link object file command: gcc -m64 -no-pie -o executable.out -std=c11 circle.o egyptian.o
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;============================================================================================================

extern scanf                          ;To input
extern printf                         ;To output
global circle


section .data

    welcome db "This circle function is brought to you by Patricia Ong.", 0x0A, 0

    inputRadiusPrompt db "Please enter the radius of a circle as a floating point number: ", 0
    receivedNumberFormat db "The number %.8lf was received.", 0x0A, 0
    resultFormat db "The circumference of a circle with this radius is %.12lf meters.", 0x0A, 0
    ;resultFormat2 db " and %ld/7 meters.", 0x0A, 0 
    returnFormat db "The circumference will be returned to the main program. Please enjoy your circles.", 0x0A, 0

    stringFormat db "%s", 0             ;String
    ;intFormat db "%d", 10, 0
    ;longintFormat db "%ld", 0
    floatFormat db "%lf", 0x0A, 0       ;Double with new line
    preciseFloat db "%.12lf", 0x0A, 0    ;Tells print f after the decimal point print 6 numbers.
                                            ;Above makes it precision 6. 

 section .bss
 
   ;qword1: resq 1                      ;resq 1 = reserve 1 quadword (For the array and to store int)

section .text

circle:

    ;Align the stack
    push rbp                            ;1 -- The stack is originally not aligned.
    mov rbp, rsp                        ;rbp holds the address of the start of this new stack

    ;16 pushes
    push rdi ;2
    push rsi ;3
    push rdx ;4
    push rcx ;5
    push r8  ;6
    push r9  ;7
    push r10 ;8
    push r11 ;9
    push r12 ;10
    push r13 ;11
    push r14 ;12
    push r15 ;13
    push rbx ;14
    pushf ;15
    push rax ;16
;---------------------------------------------------------------------------------------------------------------------------------
    
    ;Print Welcome Message
    xor rax, rax
    mov rdi, stringFormat               ;%s
    mov rsi, welcome                    ;"This circle function is brought to you by Patricia."
    call printf

    ;Print Input Prompt
    xor rax, rax                        ;Does the same as mov rax, 0.
    mov rdi, stringFormat               ;%s
    mov rsi, inputRadiusPrompt          ;"Please enter the radius of a circle as a floating point number: " 
    call printf

    ;Get Input using scanf
    push qword 10000
    xor rax, rax                        ;Mov rax, 0
    mov rdi, floatFormat                ;%lf = taking in a double input from user
    mov rsi, rsp                        ;Takes top stack into rsi
    call scanf
    movsd xmm15, [rsp]                  ;mov the value of rsp to xmm15 (xmm15 has the input value/radius)
    
    ;Print Received number
    xor rax, rax
    mov rdi, receivedNumberFormat       ;"The number %lf was received." 
    mov rax, 1                          ;Print 1 floating point
    movsd xmm0, xmm15                      
    call printf

    ;Set r14 to hold the value of pi = 0x400921FB54442D18 (in base 16, IEEE754 double format)
    mov r14, 0x400921FB54442D18        ;Hex representation of Pi in IEEE, and moving it to r14
    
    ;Set r13 to hold the value of 2 = 0x4000000000000000
    mov r13, 0x4000000000000000


    ;First Way: Mov r14 (Pi) to xmm14
    movq xmm14, r14                     ;Allows the mov of quadword r14 to xmm14. 
    ;Second Way: Push, movsd, Pop
    ;push r14                            ;Push (store+9*++ to r13) it on top of the stack.
    ;movsd xmm14, [rsp]                  ;mov the stack pointer to xmm14
    ;pop r14                             ;Retrieves the last value pushed from stack (r14)

    ;First Way: Mov r13 (2) to xmm13
    movq xmm13, r13                     ;xmm13 holds 2
    ;Second Way: Push, movsd, Pop
    ;push r13                           ;Push (store to r13) it on top of the stack.
    ;movsd xmm13, [rsp]                 ;mov the stack pointer to xmm14
    ;pop r13                            ;Retrieves the last value pushed from stack (r13).

    ;C = 2 * pi * r
    ;Multiply r*2 
    mulsd xmm15, xmm13                  ;mulsd - single value, double precision

    ;Multiply (r*2) to r14 (pi)
    mulsd xmm15, xmm14                  ;xmm15 has the circumference

    ;Print Circumference of a Circle
    xor rax, rax
    mov rdi, resultFormat               ;"The circumference of a circle with this radius is %lf meters"
    mov rax, 1                          ;Print 1 floating point
    movsd xmm0, xmm15                      
    call printf

    ;Print return to main
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, returnFormat
    call printf

    
    pop rax                             ;To balance the stack.
    movsd xmm0, xmm15                   ;Return value to main
;----------------------------------------------------------------------------------------------------------------------------------
    ;16 pops
    pop rax ;16
    popf ;15
    pop rbx ;14
    pop r15 ;13
    pop r14 ;12
    pop r13 ;11
    pop r12 ;10
    pop r11 ;9
    pop r10 ;8
    pop r9 ;7
    pop r8 ;6
    pop rcx ;5
    pop rdx ;4
    pop rsi ;3
    pop rdi ;2
    pop rbp  ;1
    ret
