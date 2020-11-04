;Patricia Ong
;CPSC 240-1 Midterm Program

extern printf                           ;External C++ function for writing to standard output device.
extern scanf                            ;External C++ function for reading from the standard input device.
extern atol                             ;External asm function for converting a 
extern isinteger                        ;External C++ function function 

global input_array                      ;Makes input_array callable by functions outside of this file.

section .data                           ;Place initialized data here.
    
    errorMsg db "Invalid input, enter another integer value.", 10, 0     ;Message if input value is invalid.

    signedIntFormat db "%ld", 0            ;General signed integer format.
    stringInputFormat db "%s", 0           ;General string format
section .bss                            ;Declare pointers to un-initialized space in this segment.
    
section .text                           ;Place executable instructions in this segment.

input_array:                            ;Entry point. Execution begins here
    
    ;Push statements
    ;Every start of the stack, push and mov
    push rbp                           ;This marks the start of a new stack frame.
    mov rbp, rsp                        ;rbp holds the address of the start of this new stack frame.
                                        ;hold the same value it holds now.
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    ;push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    ;push r14
    ;push r15
     
;------------------------------------------------------------------------------------------------------------
    ;Save the data passed to this program.
    mov r14, rdi                 ;r14 holds the pointer to the array.
    mov r15, rsi                 ;r15 holds the size of the array. 
    mov r13, 0                   ;Initialize the counter to 0
    mov r12, 0                   ;Initialize the r12 to 0 for atol

begin_loop:

    ;Get Input from user using scanf
    mov rdi, stringInputFormat          ; "%s"      
    push qword 0                        ;Create space in memory for number that's inputted.       
    mov rsi, rsp                        ;rsi points to the quadword of available space in memory
    mov rax, 0
    call scanf                          ;Call extern scanf function

    ;Ctrl+d
    cdqe                                ;Convert Doubleword to Quadword
    cmp rax, -1                         ;Compare rax with -1
    je end_loop                         ;if rax == -1, then exit from the loop/ctrl+d

    ;Input Validation
    mov qword rax, 0
    mov rdi, rsp
    call isinteger                      ;Calling isinteger
    cmp rax, 0                          ;Compare 0 to rax.
    je invalidinput                     ;Jump to invalid input block, if its not an integer. 

    ;Calling atol: Converts 
    mov qword rax, 0
    mov rdi, rsp                                                
    call atol                           ;Call atol asm extern file. 
    mov r12, rax                        ;r12 has the actual value of the array.                

    pop r8
   
    ;If input is valid, add integer to array
    mov [r14 + r13 * 8], r12            ;r13 pointer to the array, r13 the counter, 8 (rate of increment)
    inc r13                             ;Increment the counter, r13
  
   ;Check if the counter to the size of the array. 
    cmp r13, r15                         ;Comparing
    je end_loop                          ;If size has been reached, end the loop. 

    jmp begin_loop                      ;Begin the loop again.
invalidinput:

    mov rdi, stringInputFormat          ; "%s"
    mov rsi, errorMsg                   ; "Invalid Input."
    mov rax, 0
    call printf                         ;Call extern print f function.

    pop r9

    jmp begin_loop                      ;Begin the loop.

;------------------------------------------------------------------------------------------------------------
end_loop:

    ;Pop statements
    pop r8
    mov rax, r13
    
    ;pop r15
    ;pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    ;pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbp                             ;System stack is the same state before execution.
    ret                                 ;Return