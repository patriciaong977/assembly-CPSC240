;******************************************************************************************************************************
; California State University, Fullerton, hereby disclaims all copyright interest 
;       in the program "Circumference of Circle"  (which calculates the circumference of a circle) 
;       written by Patricia Ong.  
;
;
;Name: Patricia Ong
; Program name: Circumference of Circle
;           A program that will compute the approximate circumference of a circle using only integers.
;               Pi = 3.14 = 22/7 
;               Circumference = 2 * pi (22/7) * radius
; Class: CPSC 240-1
;       For Submission.
;******************************************************************************************************************************

section .data

    welcome db "This circle function is brought to you by Patricia.", 10, 0
    inputRadiusPrompt db "Please enter the radius of a circle in whole number of meters: ", 0
    receivedNumberFormat db "The number %ld was received.", 10, 0
    resultFormat1 db "The circumference of a circle with this radius is %ld", 0
    resultFormat2 db " and %ld/7 meters.", 10, 0 
    returnFormat db "The integer part of the area will be returned to the main program. Please enjoy your circles.", 10, 0

    stringFormat db "%s", 0
    intFormat db "%d", 10, 0
    longintFormat db "%ld", 0

 section .bss
    qword1: resq 1                      ;resq 1 = reserve 1 quadword (For the integer)

section .text 

    extern printf                       ;Calls printf library. For print output.
    extern scanf                        ;Calls scanf library.  For input data.
    global circle   

circle:
    
    ;Align the stack
    push rbp                            ;Need for scanf -- The stack is originally not aligned.

    ;Print Welcome Message
    mov rdi, stringFormat
    mov rsi, welcome                    ;"This circle function is brought to you by Patricia."
    mov rax, 0
    call printf

    ;Print Input Prompt
    mov rdi, stringFormat
    mov rsi, inputRadiusPrompt          ;"Please enter the radius of a circle in whole number of meters: " 
    mov rax, rax
    call printf

    ;Get Input using scanf
    mov rdi, longintFormat      
    mov rsi, qword1                     ;Copies value stored in rsi (inputRadiusPrompt) to qword1
    mov rax, 0
    call scanf

    ;Print Received number
    mov rdi, receivedNumberFormat       ;"The number %ld was received." 
    mov rsi, [qword1]                   ;qword1 is the address, [qword1] is the actual value. Moving actual value instead of address
    mov rax, 0
    call printf

    ;Multiply 44 (numerator) to input
    mov rax, [qword1]
    mov rcx, 44                          
    mul rcx
    mov r12, rax                        ;Storing the value into r12

    ;Divide multiple by 7 (denominator)
    mov rdx, 0
    mov rax, r12                        ;Dividend
    mov rcx, 7                          ;Divisor
    idiv rcx                            ;Divide operator
    mov r12, rax                        ;Quotient in RAX
    mov r13, rdx                        ;Remainder in RDX

    ;Print resultFormat1
    mov rdi, resultFormat1              ;"The circumference of a circle with this radius is %ld"
    mov rsi, r12                        
    mov rax, 0
    call printf

    ;Print resultFormat2
    mov rdi, resultFormat2              ;" and %ld/7 meters."
    mov rsi, r13
    mov rax, 0
    call printf

    ;Print returnFormat
    mov rdi, returnFormat               ;"The integer part of the area will be returned to the main program. Please enjoy your circles."
    mov rsi, stringFormat
    mov rax, 0
    call printf

    ;Restore the Stack
    pop rbp                             ;Need for scanf

    ;Exit program with result code
    mov rax, r12
    ret
