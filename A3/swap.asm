;============================================================================================================
;Program name: "swap". This program makes an assembly program that teaches the following:
;               Repeatedly swaps the elements if they are in the wrong order. 
;              
; File: swap.asm
; File Description: Swaps the elements of the array repeatedly if they are in the wrong order. 
;                   
; Author: Patricia Ong
; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;=============================================================================================================

extern printf                   ;External C++ function for writing to standard output device.
extern scanf                    ;External C++ function for reading from the standard input device.

extern bubblesort               ;External asm function for inputing the array.
extern manager                  ;External asm function for 

global swap

section .data

section .bss

section .text
swap:

    ;16 Pushes
    push rbp                    ;Marks the start of a new stack frame
    mov rbp, rsp                ;rbp holds the address of the start of the new stack.
    ;push rdi 
    ;push rsi
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
    pushf
    push rax
; ============================================================================================================
    ;Initializing register values
    mov r8, 0                   ;Set r8 to 0.
    mov r9, 0                   ;Set r9 to 0

    ;Bubble sort
    mov r8, [rdi]                        
    mov r9, [rsi]               
    mov [rdi], r9               
    mov [rsi], r8

; ============================================================================================================
    ;16 pops
    pop rax
    popf
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
    ;pop rsi
    ;pop rdi
    pop rbp 

    ret