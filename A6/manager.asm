;============================================================================================================
; Program name: The Heron's formula
;                   Inputs a value N, which is the number of terms in the summation, and outputs the sum,
;                       the runtime, and some intermediate values.
;              
; File: manager.asm
; File Description: Calls other functions to execute. 
;
; Author: Patricia Ong
; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
;
; Link object file command: g++ -m64 -no-pie -o executable.out -std=c11 manager.o read_clock.o main.o
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;============================================================================================================

extern printf                   ;External C++ function for writing to standard output device.
extern scanf                    ;External C++ function for reading from the standard input device.

;Read clock here?

section.data    ;Place initialized data here.

    ;Declare messages here.
    inputPrompt db "Please enter the number of terms to be included in the sum: ", 0x0A 
    read_clockNow db " The clock is now %.8lf tics and the computation will begin. ", 0x0, 0x0A
    read_clockPrint db "The clock is now %.8lf tics. ", 0x0, 0x0A ;0x0A = new line, 0 = null
    
    elapsedTime db "The elasped time was %.8lf ticks, which equals %.5lf seconds. ", 0x0, 0x0A
    returnPrompt db "The harmonic sum will be returned to the driver. ", 0x0, 0x0A

    
section.bss     ;Declare pointers to un-initialized space in this segment. 

section .text   ;Place executable instrutions in this segment

manager:

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

;------------------------------------------------------------------------------------------------------------

;=========== Show the time =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
call read_clock

mov        rdx, rax
mov        rdi, stringformat
mov		   rsi, timemessage                      ;"Please enter the radius of a circle in whole number of meters: "
call       printf                                 

;=========== Show the input message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, inputPrompt                    ;"Please enter the resistance number for each of the subcircuits separated by white space..."
call       printf                                 




;=========== input verification message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, thankyou                    ;"The total resistance is %8lf Ohms"
call       printf                                 

;=========== total resistance message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, totalresistance                   ;"Thank you. The resistance values in Ohms are:"
call       printf                                 

;=========== request for volatage message =====================================================================================
    ;enterVolt db "Please enter the voltage in this circuit:",10, 0

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, enterVolt                         ;"Please enter the voltage in this circuit:"
call       printf                                 

;=========== flow rate message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, currentFlow                       ;"Thank you. The rate of current flow is: %lf"
call       printf                                 



mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, work                              ;"The work performed in the last 1 second is %lf joules"
call       printf                                 

;=========== goodbye message =====================================================================================


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