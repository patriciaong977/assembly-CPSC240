;============================================================================================================
; Program name: "Arrays". This program makes an assembly program that teaches the following:
;              How to make an array, how to implement iteration, how to make professional looking programs,
;              how to reject invalid inputs, etc.
; File: Manager.asm
; File Description: Manager.asm calls other functions to execute. 
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
extern printf                   ;External C++ function for writing to standard output device.
extern scanf                    ;External C++ function for reading from the standard input device.

extern input_array              ;External asm function for inputing the array.
extern display_array            ;External C++ function for displaying the array.
extern sum                      ;External asm function for getting the sum of the array.
extern atolong                  ;External asm function for getting the a to long. 

;------------ Assignment 3 Additions-----------------------------------------------------------------------
extern swap                     ;Extrenal asm function for swapping values.
extern bubblesort               ;External C++ function for sorting by the bubblesort. 
;------------ End of Additions-----------------------------------------------------------------------------

global manager                  ;Makes manager callable by functions outside of this file.


section .data                   ;Place initialized data here
  
    ;Declare messages here.
    thisProgram db "This program will sort your array of integers.", 10, 0
    enterSeqPrompt db "Enter a sequence of long integers separated by white space.", 10, "After the last input press ENTER followed by CTRL+D.", 10, 0
    receivedNum db "These numbers were received and placed into the array: ", 10, 0
    sumofArray db "The sum of the %ld numbers in this array is %ld.", 10, 0

;-------------Assignment 3 Additions----------------------------------------------------------------------
    bubblesortCall db "The array has been sorted by the bubble sort algorithm. ", 10, 0
    bubblesortOrder db "This is the order of the values in the array now: ", 10, 0
    return db "The largest number in the array will now be returned to the main function. ", 10, 0
;-------------End of Additions----------------------------------------------------------------------------

    stringFormat db "%s", 0         ;General String Format
    intFormat db "%ld", 10, 0       ;General Decimal Integer


section .bss                    ;Declare pointers to un-initialized space in this segment
    
    array: resq 100             ;Reserving 100 quadwords for the array.

section .text                   ;Place executable instructions in this segment

manager:                        ;Execution begins here.

    ;The next two instructions should be performed at the start of every assembly program
    push rbp                    ;Marks the start of a new stack frame
    mov rbp, rsp                ;rbp hols the address of the start of this new stack frame. 
                                    ;a When this function returns to its caller rbp must hold
                                    ; the same value it holds now.
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

;------------------------------------------------------------------------------------------------------------
    
    mov r12, 100                ;Set max size for the array (100).

    ;Print about Message
    mov qword rax, 0                
    mov rdi, stringFormat       ;"%s"
    mov rsi, thisProgram        ;This program will sum your array of integers.
    call printf                 ;Call printf library

    ;Print Enter Sequence Prompt
    mov rax, 0
    mov rdi, stringFormat
    mov rsi, enterSeqPrompt     ;Enter a sequence of long integers separated by white space.
    call printf

    ;Call input_array function to ask user to input numbers into the array
    mov rax, 0
    mov rdi, array              
    mov rsi, r12                ;rsi has the size of the array (100).
    call input_array
    mov r13, rax                ;r13 how many input is in the array.

    ;Print how many input in the array (For debugging, pls ignore)
    ;mov qword rax, 0
    ;mov rdi, stringFormat
    ;mov rsi, array
    ;call printf

    ;Print the received numbers placed in the array
    mov qword rax, 0    
    mov rdi, stringFormat       ; "%s"
    mov rsi, receivedNum        ;"These numbers were received and placed into the array: "
    call printf                 ;Call extern printf function

    ;Print the array
    mov rax, 0
    mov rdi, array              
    mov qword rsi, r13          
    call display_array          ;Call extern display_array function

;----------Assignment 3 Additions-------------------------------------------------------------------------
    
    ;Print about Message
    mov qword rax, 0                
    mov rdi, stringFormat       ;"%s"
    mov rsi, bubblesortCall     ;"The array has been sorted by theh bubble sort algorithm. "
    call printf                 ;Call printf library
    
    ;Print the received numbers placed in the array
    mov qword rax, 0    
    mov rdi, stringFormat       ; "%s"
    mov rsi, bubblesortOrder    ;"This is the order of the values in the array now: "
    call printf                 ;Call extern printf function
;---D--
    ;Call the bubblesort function
    mov qword rax, 0
    mov rdi, array              ;Array
    mov rsi, r13                ;Size
    call bubblesort             ;Call extern bubblesort function                
    mov r14, rax                ;Largest Value

    ;Print the sorted version of the array
    mov qword rax, 0
    mov rdi, array              ;Now the sorted array
    mov rsi, r13            
    call display_array          ;Call extern display_array function
    

;---------End of Additions--------------------------------------------------------------------------------
   
    ;Call the function sum
    ;mov qword rax, 0
    ;mov rdi, r14
    ;mov rsi, r13
    ;call sum                    ;Call extern sum function
    ;mov r12, rax                ;r12 holds the sum of the array.

    ;Print sum of the array
    ;mov qword rax, 0
    ;mov rdi, sumofArray         ;"The sum of the %ld numbers in this array is %ld."
    ;mov rsi, r13
    ;mov rdx, r12                
    ;call printf                 ;Call printf function

 ;------ Assignment 3 Additions ---------------------------------------------------------------------------   
    
    ;Print return
    mov qword rax, 0
    mov rdi, stringFormat       ;"%s"
    mov rsi, return             ;The largest number in the array will now be returned to the main function. "
    call printf                 ;Call printf function

    ;Return the largest number in the array to main. 
    mov rax, r14    

;------End of Additions------------------------------------------------------------------------------------

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
    
    pop rbp                     ;Stack is in the same state it was when this function began
    ret                         ;Return