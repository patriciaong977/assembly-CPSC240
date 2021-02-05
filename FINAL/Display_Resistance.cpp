//============================================================================================================
// Program name: Electricity Program
//             
// File: Display_Resistance
// File Description: Displays the Resistance output.
//                        
// Author: Patricia Ong
// CWID: 8874 19224
// Section: 240-1

// Email: patricia.ong977@csu.fullerton.edu
// Institution: California State University, Fullerton.
//
// Link object file command: g++ -m64 -fno-pie -no-pie -o exe.out Electricity.o isfloat.o Display_Resistance.o 
//  Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o
//
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================

#include <stdio.h>

extern "C" void Display_Resistance(double array[], long index);        

void Display_Resistance(double array[], long index)
{
    //For loop
    for (long i = 0; i < index; i++)
    {
        printf("%lf", array[i]);
    } // End of for loop

    printf("\n");
}