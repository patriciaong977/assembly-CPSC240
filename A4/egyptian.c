//============================================================================================================
// Program name: circle 
//               This program calculates the circumference of a circle.
//              
// File: egyptian.c
// File Description: Finding the circumference of a circle with xmm registers. Takes in a value from 
//                      circle.asm and returns it as a double. Also prints a couple lines of messages. 
// Author: Patricia Ong
// Email: patricia.ong977@csu.fullerton.edu
// Institution: California State University, Fullerton.
//
// Link object file command: gcc -m64 -no-pie -o executable.out -std=c11 circle.o egyptian.o
//
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================

#include <stdio.h>
#include <stdint.h>

// Changing long int into double for xmm register.
double circle();

int main()
{
    
    double result_code = -999;
 
    printf("Welcome to your friendly circle circumference calculator. \n");
    printf("The main program will now call the circle function. \n");

    result_code = circle();

    printf("%s%.12lf%s%lx\n", "The main received this number: ", result_code, " = 0x",
                                                                     *(unsigned long*)&result_code);

    printf("Have a nice day. Main will now return 0 to the operating system.\n");
    return 0;

} //End main

