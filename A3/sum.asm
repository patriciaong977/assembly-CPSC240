;============================================================================================================
;Program name: "Arrays". This program makes an assembly program that teaches the following:
;              How to make an array, how to implement iteration, how to make professional looking programs,
;              how to reject invalid inputs, etc.
; File: sum.asm
; File Description: Sum.asm adds all the user input in the array. 
; Author: Patricia Ong
; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;============================================================================================================
extern printf                       ;External C++ function for writing to standard output device.
extern scanf                        ;External C++ function for reading from the standard input device.

global sum                          ;Makes sum callable by functions outside of this file.

section .data                       ;Place initialized data here.

    intFormat db "%ld", 0           ;General integer/decimal format

section .bss                        ;Declare pointers to un-initialized space in this segment.

section .text                       ;Place executable instructions in this segment.

sum:                                ;Entry point. Execution begins here.

;Every start of the stack, push and mov
    push rbp                            ;This marks the start of a new stack frame.
    mov rbp, rsp                        ;rbp holds the address of the start of this new stack frame.
                                            ;hold the same value it holds now.
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    
;------------------------------------------------------------------------------------------------------------

    mov r14, rdi            ;Actual Array. 
    mov r13, rsi            ;The number of elements in the array
    mov r12, 0              ;Counter
    mov r15, 0              ;The sum of the Array

begin_add:                  ;Execution begins here.
    cmp r12, r13            ;Compare the counter and the number of elements in the array.    
    je end_add              ;If jump condition is met above. If r12 = r13, then end_add. 

    add r15, [r14 + r12 * 8]    ;r14 array location, r12 increments, 8 (rate you increment)
    inc r12                     ;Increment the counter

    jmp begin_add               ;Jump to begin_add

end_add:

    mov rax, r15                ;Set the sum of the array to rax. To return the value of the sum.

;------------------------------------------------------------------------------------------------------------
    
    ;Restore the pointer to the start of the stack frame.
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    
    pop rbp                             ;System stack is the same state before execution.
    ret                                 ;return 