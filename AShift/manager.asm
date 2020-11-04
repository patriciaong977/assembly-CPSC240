;Patricia Ong
;CPSC 240-1 Midterm Program

extern printf                   ;External C++ function for writing to standard output device.
extern scanf                    ;External C++ function for reading from the standard input device.

extern input_array              ;External asm function for inputing the array.
extern display_array            ;External C++ function for displaying the array.
;--------------------------------------------------------------------------------------------------------
extern shift                    ;External asm function for getting the shift of the array.
;--------------------------------------------------------------------------------------------------------
extern atolong
global manager                  ;Makes manager callable by functions outside of this file.


section .data                   ;Place initialized data here
  
    ;Declare messages here.
    thisProgram db "This program will shift your array of integers.", 10, 0
    enterSeqPrompt db "Please enter separated by white space. Press enter and cntl+d to finished.", 10, 0
    receivedNum db "The values in the array are: ", 10, 0
   
    return db "The last value in the array will be returned to the driver. ", 10, 0

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
    mov rdi, array              ;r14
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

;------------------------------------------------------------------------------------------------------------
 
    ;Call the function shift
    mov qword rax, 0
    mov rdi, array
    mov rsi, r13
    call shift                  ;Call extern shift function
    mov r12, rsi                ;r12 holds the shift of the array.

    inc r13                     ;+1 to r13

    ;Print the shift right of the array
    mov qword rax, 0
    mov rdi, receivedNum         ;"The values in the array are: %ld"
    mov rsi, r13
    mov rdx, r12                
    call printf                 ;Call printf function

    ;Print the shifted array
    mov rax, 0
    mov rdi, array              
    mov qword rsi, r13          
    call display_array          ;Call extern display_array function
    
  ;----------------------------------------------------------------------------------------------------------
    ;Print return
    mov qword rax, 0
    mov rdi, stringFormat       ;"%s"
    mov rsi, return             ;"The last value in the array will be returned to the driver. "
    call printf                 ;Call printf function
  ;----------------------------------------------------------------------------------------------------------
    
    dec r13                     ;-1 to r13
    ;Return last value of the array to (rax) main.
    mov rax, [array + 8 * r13]

  ;----------------------------------------------------------------------------------------------------------

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