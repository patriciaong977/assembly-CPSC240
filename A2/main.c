//============================================================================================================
//Program name: "Arrays". This program makes an assembly program that teaches the following:
//              How to make an array, how to implement iteration, how to make professional looking programs,
//              how to reject invalid inputs, etc.
// File: Main.c
// File Description: Displays the welcome message, author name and the result code of the manager.asm.
// Author: Patricia Ong
// Email: patricia.ong977@csu.fullerton.edu
// Institution: California State University, Fullerton.
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================

#include "stdio.h"

//Manager return is long int
long int manager();

int main()
{
    long int result_code = -999;
    
    //Prints 1st line
    printf("%s", "Welcome! \n");    
    //Prints 2nd line
    printf("%s", "Brought to you by Patricia Ong. \n");

    //Get result_code from the manager function
    result_code = manager();

    //Print Last two lines of the Prompt
    printf("%s%ld%s\n", "Main received, ", result_code, " and is not sure what to do with it. \n");
    printf("%s", "Main will return 0 to the operating system. Bye. \n");
    
    return 0;
}
