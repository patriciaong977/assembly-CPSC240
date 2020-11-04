//============================================================================================================
//Program name: "Arrays". This program makes an assembly program that teaches the following:
//              How to make an array, how to implement iteration, how to make professional looking programs,
//              how to reject invalid inputs, etc.
// File: input_array.asm
// File Description: Displays the array to the user. 
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

#include <stdio.h>

extern "C" void display_array(long array[], long size);        

void display_array(long int array[], long int index)
{
    //For loop
    for (long i = 0; i < index; i++)
    {
        printf("%ld", array[i]);
        printf("%s", " ");
    } // End of for loop

    printf("\n");
}