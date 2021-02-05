//============================================================================================================
// Program name: The Heron's formula
//
//
//              
// File: main.cpp
// File Description: Displays the time on the cpu clock from read_clock,
//                      welcome message, author name, and the result code from manager.asm.
//                      
// Author: Patricia Ong
// Email: patricia.ong977@csu.fullerton.edu
// Institution: California State University, Fullerton.
//
// Link object file command: g++ -m64 -no-pie -o executable.out -std=c11 area.o isfloat.o triangle.o
//
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================

#include "stdio.h"

//Manager.asm return is double
double manager();

//Read_clock.asm return is long int
long int read_clock();

int main()
{
    double result = -999; //Result from area function

    //Prints Welcome Message
    printf("%s", "Welcome to the Harmonic Sum programmed by Patricia Ong. \n");

    //Read-clock here

    //Last two lines of the prompt
    printf("%s%ld%s\n", "The driver received this number ", result , " and will keep it. \n");
    printf("%s\n", "A zero will be returned to the operating system. Have a nice day. \n");


    return 0;
}