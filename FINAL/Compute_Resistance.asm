;============================================================================================================
; Program name: Electricity Program
;              
; File: Compute_Resistance
; File Description: Make a program that computes total resistance in a parallel electrical circuit.
;                       It also computes a couple of minor details. 
;
; Author: Patricia Ong
; CWID: 8874 19224
; Section: 240-1

; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
;
; Link object file command: g++ -m64 -fno-pie -no-pie -o exe.out  Electricity.o isfloat.o Display_Resistance.o 
;                               Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o 
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;============================================================================================================

extern scanf                ;To input
extern printf               ;To output

global Compute_Resistance   ;Makes manager callable by functions outside of this file.
                                ;For main.c to call manager.asm

section .data               ;Place initialized data here

    stringFormat db "%s", 0
    floatFormat db "%lf", 0, 0x0A

section .bss                ;Declare pointers to un-initialized space in this segment

section .text               ;Place executable instructions in this segment

Compute_Resistance:

;Align the stack
    push rbp                ;1 -- The stack is originally not aligned.
    mov rbp, rsp            ;rbp holds the address of the start of this new stack

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
    ;push rax ;16

;---------------------------------------------------------------------------------------------------------------------------------
    mov r15, rdi    ;Array
    mov r14, rsi    ;Size

    mov r13, 0x0000000000000000     ;0
    movq xmm15, r13     ;Sum

    mov r12, 0

    ;RESISTANCE FORMULA: 1/R = 1/R1 + 1/R2 + 1/RN
    
start:
    
    cmp r12, r14
    je end

    mov r13, 0x3ff0000000000000
    movq xmm13, r13
    
    ;Divide and Add
    divsd xmm13, [r15 + 8 * r12] ;1/RN
    addsd xmm15, xmm13          ;1/R1 + 1/R2 + 1/RN

    inc r12
    jmp start

end:

    mov r13, 0x3ff0000000000000
    movq xmm13, r13
    divsd xmm13, xmm15



    movsd xmm0, xmm13   ;Return value

;----------------------------------------------------------------------------------------------------------------------------------
    
    ;16 pops
    ;pop rax ;16
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
