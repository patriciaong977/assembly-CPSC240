//============================================================================================================
// Program name: Area of Triangle
//               This program will input three quadword float numbers representing the sides of a triangle.
//                   After confirming that the inputs are in fact valid floats then computer the area of
//                   the triangle using Heron's formula. 
//              
// File: triangle.c
// File Description: 
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

//Area.asm return
double area();

int main()
{
    double area_result = -999; //Result from area function

    //Prints Welcome Message.
    printf("%s", "Welcome to Area of Triangles by Patricia Ong. \n");
    printf("%s", "This program will compute the area of your triangle. \n");

    //Get value from area.asm
    area_result = area();

    //Print two lines of the Prompt
    printf("%s%lx%s", "\nThe driver received this number, 0x ", *(unsigned long*)&area_result, " and will keep it. \n");
    printf("%s", "Now 0 will be returned to the operating system. Bye. \n");

    return 0; 
}