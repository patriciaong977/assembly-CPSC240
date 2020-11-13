;============================================================================================================
; Program name: Area of Triangle
;               This program will input three quadword float numbers representing the sides of a triangle.
;                   After confirming that the inputs are in fact valid floats then computer the area of
;                   the triangle using Heron's formula. 
;              
; File: area.asm
; File Description: Finds the area of a triangle. 
;
; Author: Patricia Ong
; Email: patricia.ong977@csu.fullerton.edu
; Institution: California State University, Fullerton.
;
; Link object file command: g++ -m64 -no-pie -o executable.out -std=c11 area.o isfloat.o triangle.o
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

extern isfloat              ;External C++ function for validating ifuser input is a float.

extern atof                 ;External function that takes string to float. 

global area                 ;Makes area callable by functions outside of this file.
                                ;For triangle.c to call area.asm

section .data

    inputPrompt db "Please enter the floating point lengths of the 3 sides of your triangle. ", 0x0A, 0 ;0 = null, 0x0A = new line
    sideOne db "Side 1: ", 0, 0x0A
    sideTwo db "Side 2: ", 0, 0x0A
    sideThree db "Side 3: ", 0, 0x0A
    receivedValues db "These values were received:  %.8lf  %.8lf  %.8lf ", 0x0A, 0
    triangleArea db "The area of this triangle is %.8lf square meters. ", 0x0A, 0
    errorMsg db "An invalid input was detected. Please run the program again.", 0x0A, 0

    stringFormat db "%s", 0
    floatFormat db "%lf", 0, 0x0A

section .bss

section .text

area:
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
    ;Print Input Prompt
    xor rax, rax            ;Does the same as mov rax, 0. (Faster)
    mov rdi, stringFormat   ;%s
    mov rsi, inputPrompt    ;"Please enter the floating point lengths of the 3 sides of your triangle. "
    call printf

;---------------------------------------------------------------------------------------------------------------------------------
    sub rsp, 64             ;Gives space for the input value.
    jmp Start               ;Jmp to Start

;----------------------------------------------------------------------------------------------------------
    ;If Input is not a float, it's Invalid.
    Invalid:
    xor rax, rax            ;Does the same as mov rax, 0
    mov rdi, errorMsg       ;"An invalid input was detected. Please run the program again."
    call printf

;----------------------------------------------------------------------------------------------------------
    Start:
    ;Print Input Side 1
    xor rax, rax            ;Does the same as mov rax, 0. 
    mov rdi, stringFormat   ;%s
    mov rsi, sideOne        ;"Side 1: "
    call printf
    ;Get Input for side
    xor rax, rax            ;Does the same as mov rax, 0.
    mov rdi, stringFormat   ;"%s"
    mov rsi, rsp            ;Takes top stack into rsi.
    call scanf

    ;Check if Input is a float
    mov rdi, rsp            ;Stack pointer to rdi (holds string input).
    mov rax, 1              
    call isfloat            ;Checking if it is a float, should return rax with value.

    mov r15, 0              ;mov 0 to r15
    cmp rax, r15            ;Cmp to r15 to rax, if rax is == to r15 then Jump near if equal.  
    je Invalid              ;Invalid shows that there was an invalid input.

    ;If valid,
    mov rax, 0
    mov rdi, rsp           ;Mov stack pointer to rdi 
    call atof              ;Takes the value in rsp (stack) into xmm0.
    movsd xmm15, xmm0      ;mov the value of rsp to xmm15 (xmm15 has the input value side one)

;----------------------------------------------------------------------------------------------------------
    ;Print Input Side 2
    xor rax, rax            ;Does the same as mov rax, 0. 
    mov rdi, stringFormat   ;%s
    mov rsi, sideTwo        ;"Side 2: "
    call printf

    xor rax, rax            ;Does the same as mov rax, 0.
    mov rdi, stringFormat   ;"%s"
    mov rsi, rsp            ;Takes top stack into rsi.
    call scanf

    ;Check if Input is a float
    mov rdi, rsp            ;Stack pointer to rdi (holds string input).
    mov rax, 1
    call isfloat            ;Checking if it is a float, should return rax with value.

    mov r15, 0              ;mov 0 to r15
    cmp rax, r15            ;Cmp to r15 to rax, if rax is == to r15 then Jump near if equal.
    je Invalid              ;Invalid shows that there was an invalid input.

    ;If valid, 
    mov rax, 0
    mov rdi, rsp           ;Mov stack pointer to rdi
    call atof              ;Takes the value in rsp (stack) into xmm0.
    movsd xmm14, xmm0      ;mov the value of rsp to xmm14 (xmm14 has the input value side two)

;---------------------------------------------------------------------------------------------------------
    ;Print Input Side 3
    xor rax, rax            ;Does the same as mov rax, 0. 
    mov rdi, stringFormat   ;%s
    mov rsi, sideThree      ;"Side 3: "
    call printf

    xor rax, rax            ;Does the same as mov rax, 0.
    mov rdi, stringFormat   ;"%s"
    mov rsi, rsp            ;Takes stack pointer to rsi.
    call scanf

    ;Check if Input is a float
    mov rdi, rsp            ;Mov stack pointer to rdi (holds string input).
    mov rax, 1
    call isfloat            ;Checking if it is a float, should return rax with value.

    mov r15, 0              ;mov 0 to r15
    cmp rax, r15            ;Cmp to r15 to rax, if rax is == to r15 then Jump near if equal.
    je Invalid              ;Invalid shows that there was an invalid input.

    ;If valid, 
    mov rax, 0
    mov rdi, rsp            ;Mov stack pointer to rdi.
    call atof               ;Takes the value in rsp (stack) into xmm0.
    movsd xmm13, xmm0       ;mov the value of rsp to xmm13 (xmm13 has the input value side three)
    
;---------------------------------------------------------------------------------------------------------    
    add rsp, 64             ;Reset's the stack, since subtracted earlier.
    
    ;Print Received number
    mov rdi, receivedValues ;"These values were received:  %.8lf  %.8lf  %.8lf " 
    mov rax, 3              ;Print 3 floating point
    movsd xmm0, xmm15       ;Print side one
    movsd xmm1, xmm14       ;Print side two
    movsd xmm2, xmm13       ;Print side three
    call printf
    
; --------------------------------------------------- Heron's Formula Here--------------------------------------------------------
; -----------------------S = [(xmm15)+(xmm14)+(xmm13)]/2--------------------------------------------------------------------------

    ;Set r14 to the value of 2 in hex. (0x4000000000000000)
    mov r14, 0x4000000000000000 ;Hex representation of 2 moving to r14
    movq xmm11, r14             ;Allows the mov r14 to xmm11(has the value of 2).

    movsd xmm12, xmm15          ;Mov side1 to xmm12 
    addsd xmm12, xmm14          ;Add side2 to xmm12 (S1+S2 = xmm12)
    addsd xmm12, xmm13          ;Add side3 to xmm12 ((S1+S2)+S3 = xmm12)

    divsd xmm12, xmm11          ;xmm12 (Value of all Sides = S) / xmm11 (2) = xmm12 (quotient = S)

; ----------------------A = sqrt(S[S-A][S-B][S-C])--------------------------------------------------------------------------------
    
    movsd xmm11, xmm12          ;Mov xmm12(S) to xmm11
    subsd xmm11, xmm15          ;xmm11(S) - xmm15(side1)
    movsd xmm15, xmm11          ;Mov xmm11 to xmm15 (S-A)

    movsd xmm11, xmm12          ;Mov xmm12(S) to xmm11
    subsd xmm11, xmm14          ;xmm11(S) - xmm14(side2)
    movsd xmm14, xmm11          ;Mov xmm11 to xmm14 (S-B)
    
    movsd xmm11, xmm12          ;Mov xmm12(S) to xmm11
    subsd xmm11, xmm13          ;xmm11(S) - xmm14(side3)
    movsd xmm13, xmm11          ;Mov xmm11 to xmm13 (S-C)

    mulsd xmm12, xmm15          ;xmm15(S-A) * xmm12(S) = S(S-A)
    mulsd xmm12, xmm14          ;xmm14(S-B) * xmm12(S(S-A)) = S(S-A)(S-B)
    mulsd xmm12, xmm13          ;xmm13(S-C) * xmm12(S(S-A)(S-B)) = S(S-A)(S-B)(S-C)

    sqrtsd xmm15, xmm12         ;Sqrt(xmm12) and move it to xmm15(Area of Triangle = A)

;--------------------------------------------------------------------------------------------------------------------------------
    ;Print Area of the Triangle
    xor rax, rax
    mov rdi, triangleArea   ;"The area of this triangle is %.8lf square meters. "
    mov rax, 1              ;Print 1 floating point
    movsd xmm0, xmm15       ;Print Area of Triangle (xmm15 = area of triangle)
    call printf

    movsd xmm0, xmm15      ;Return value to main (xmm15 = area of triangle)      

    ;ucomisd                ;Don't have to do. Changed isfloat to accept only positive numbers. 
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
