;============================================================================================================
;Program name: "read_clock". This program makes an assembly program that teaches the following:
;              To read the CPU's own clock.
;              
; File: read_clock.asm
; File Description: Gets the details of the processor, and reads how many CPU ticks took place since
;                           the processor was reset and returns the number of ticks. 
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

global read_clock               ;Makes read_clock callable by functions outside of this file.        

section .data                   ;Place initialized data here. 

    testFormat db "For testing purposes.", 10, 0
    stringFormat db "%s", 0
    intFormat db "%ld", 10, 0

section .bss                    ;Declare pointers to un-initialized space in this segment. 

section .text                   ;Place executable instructions in this segment.


read_clock:                     ;Execution begins here.

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
    pushf

    ;push rax           ;It needs to return the value of rax to main
;=============================================================================================================
    
    mov rdx, 0          ;Initialize rdx
    mov rax, 0          ;Initialize rax
    
    ;Print test output
    ;mov rdi, stringFormat
    ;mov rsi, testFormat
    ;mov rax, 0
    ;call printf

    cpuid               ;Get details of the processor.
    rdtsc               ;Read how many CPU ticks took place since the processor was reset.
    shl rdx, 32         ;Shift 32 bits of rdx.
    add rax, rdx        ;Number of tics is now stored into rax. 

;=============================================================================================================
    ;16 pops
    ;pop rax            ;Since rax needs to return rdx. 

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
    pop rsi
    pop rdi

    pop rbp                     ;Stack is in the same state it was when this function began. 
    ret                         ;Return