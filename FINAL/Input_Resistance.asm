;============================================================================================================
; Program name: Electricity Program
;              
; File: main.c
; File Description: Takes in user input to program.
;                      
; Author: Patricia Ong
; CWID: 8874 19224
; Section: 240-1
;
; Email: patricia.ong977@gmail.com
; Institution: California State University, Fullerton.
;
; Link object file command: g++ -m64 -fno-pie -no-pie -o exe.out Electricity.o isfloat.o Display_Resistance.o 
;               Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o
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

extern isfloat              

global Input_Resistance                                  

section .data      

messageinvalid db "Invalid input please retry:",10,0
finish db "You pressed Control D.", 10, 0
tryagain db "This is not a valid input. Try again." , 10, 0
negative db "Input must be greater than 0 ", 10, 10, 0

test db " hereeeeeeeeeeee ", 10, 0

stringFormat db "%s", 0
integerformat db "%ld", 10, 0
floatformat db "%lf",10,0

section .bss                

section .text               

Input_Resistance:

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

start:

    push qword 99
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, rsp
    call scanf

    ;Ctrl+D
    cdqe
    cmp rax, -1
    je ctrld

inputvalidate:
    
    mov rax, 1
    mov rdi, rsp
    call isfloat
    mov r13, rax

    cmp r13, 0
    je invalid

    xor rax, rax
    mov rdi, rsp
    call atof
    movsd xmm15, xmm0

    mov r11, 0x0000000000000000
    movq xmm14, r11
    ucomisd xmm15, xmm14
    jbe negativeloop

    movsd[r15 + r15 * 8], xmm15
    pop rax
    inc r14

    jmp start

ctrld:
    
    xor rax, rax
    mov rdi, stringFormat
    mov rsi, finish
    call printf
    pop rax

    jmp end


invalid:

    xor rax, rax
    mov rdi, stringFormat
    mov rsi, tryagain
    call printf
    pop rax
    
    jmp start

negativeloop:

    xor rax, rax
    mov rdi, stringFormat
    mov rsi, negative
    call printf
    pop rax

    jmp start

end:

    mov rax, r14
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
