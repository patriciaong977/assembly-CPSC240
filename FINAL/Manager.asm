;============================================================================================================
; Program name: Electricity Program
;              
; File: Manager.asm
; File Description: Make a program that computes total resistance in a parallel electrical circuit.
;                       It also computes a couple of minor details. 
;
; Author: Patricia Ong
; CWID: 8874 19224
; Section: 240-1

; Email: patricia.ong977@gmail.com
; Institution: California State University, Fullerton.
;
; Link object file command: g++ -m64 -fno-pie -no-pie -o exe.out Electricity.o isfloat.o Display_Resistance.o 
;                           Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU
; General Public License version 3 as published by the Free Software Foundation.
; This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
; implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
; for more details.
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
;============================================================================================================

extern scanf                
extern printf               
extern atof  

extern Input_Resistance     
extern Compute_Resistance   
extern Display_Resistance   

               
extern isfloat              

global Manager              ;Makes manager callable by functions outside of this file.


section .data               ;Place initialized data here

    inputPrompt db "Please enter the resistance number for each of the subcircuits separated by white space. ", 10, "Press Cntl+D to terminate. ", 10 ,0 

    thankyou db "Thank you. The resistance values in Ohms are:", 10,0
    totalresistance db "The total resistance is %.8lf Ohms.", 0x0A, 0

    enterVolt db "Please enter the voltage in this circuit:", 10, 0
    currentFlow db "Thank you. The rate of current flow is: %lf", 10, 0
    work db  "The work performed in the last 1 second is %lf joules", 10, 0

    return db "The manager will return the work value to the caller. ", 10, 0

    errorMsg db "An invalid input was detected. Please run the program again.", 0x0A, 0

    testme db " heereeeeeeeeeeeeeeeee ", 10, 0

    intFormat db "%ld",10,0
    stringFormat db "%s",10,0
    floatFormat db "%lf", 10, 0

section .bss                ;Declare pointers to un-initialized space in this segment

array: resq 100

section .text               ;Place executable instructions in this segment

Manager:

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

;---------------------------------------------------------------------------------------------------------------------------------
               
;Print Input Resistance Number
xor rax, rax 
mov rdi, stringFormat
mov rsi, inputPrompt     ;"Please enter the resistance number for each of the subcircuits separated by white space..."
call printf               
                  
xor rax, rax 
mov rdi, stringFormat
mov rsi, testme
call printf  

;Call Input_Resistance
push qword 100
xor rax, rax
mov rdi, array
call Input_Resistance
mov r15, rax
pop rax
                                
;Print Array 
xor rax, rax
mov rdi, stringFormat
mov rsi, thankyou        ;"Thank you. The resistance values in Ohms are:"
call printf                                 

;Call Display Resistance
push qword 0
xor rax, rax
mov rdi, array
mov rsi, r15
call Display_Resistance
pop rax

;Call Compute_Resistance
xor rax, rax
mov rdi, array
mov rsi, r15
call Compute_Resistance
movsd xmm15, xmm0           ;Total Resistance


;Print Voltage Message
mov qword  rax, 0 
mov        rdi, stringFormat
mov        rsi, enterVolt   ;"Please enter the voltage in this circuit:"
call       printf                                 


;Get Input for Voltage
xor rax, rax
mov rdi, floatFormat
mov rsi, rsp
call scanf


;mov r15, 0
;cmp rax, r15
;je Invalid

;If valid,
;mov rax, 0
;mov rdi, rsp
;call atof
;movsd xmm15, xmm0       ;xmm15 - Voltage

;divsd xmm15, xmm13      ;xmm15 - Voltage / xmm13 - Total Resistance
                            ;xmm15 - Current (I)

;=========== flow rate message ============================================================

xor rax, rax    
mov rdi, currentFlow
mov rax, 1                    ;"Thank you. The rate of current flow is: %lf"
movsd xmm0, xmm15
call printf                                 

;-- work

;sqrtsd xmm15, xmm15            ;Current^2
;mulsd xmm15, xmm13            ;(Current^2)*(Total Resistance)

;xor rax, rax
;mov rdi, work                     ;"The work performed in the last 1 second is %lf joules"
;mov rax, 1
;movsd xmm0, xmm15
;call printf 

;=========== goodbye message ===============================================================

;----------------------------------------------------------------------------------------------------------------------------------
    
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