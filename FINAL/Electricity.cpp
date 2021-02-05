//============================================================================================================
// Program name: Electricity Program
//              
// File: Electricity.c
// File Description: Calls the Manager.asm with output lines of the program.
//                      
// Author: Patricia Ong
// CWID: 8874 19224
// Section: 240-1
//
// Email: patricia.ong977@csu.fullerton.edu
// Institution: California State University, Fullerton.
//
// Link object file command: g++ -m64 -fno-pie -no-pie -o exe.out Electricity.o isfloat.o Display_Resistance.o 
//                                  Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o
//
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================


#include "stdio.h"

//Manager return is long int
extern "C" double Manager();

//Read_clock.asm return is long int
extern "C" long int read_clock();

int main()
{
    double result_code; 
    long int numTics = 0;
    
    //Get numTics from the read_clock function. (CPU CLOCK)
    numTics = read_clock();

    //Prints 1st line
    printf("%s", "Welcome to the Ultimate Electricity Program by Patricia Ong. \n");    
    
    //Display the NumTics
    printf("%s%ld%s", "The clock is now ", numTics, " tics. \n");
    
    //Get result_code from the manager function
    result_code = Manager();

    //Print Last two lines of the Prompt
    printf("%s%ld%s\n", "The manager function received this value, ", result_code, " Thank you. \n");
    printf("Main will return 0 to the operating system. \n");
    
    return 0;
}
