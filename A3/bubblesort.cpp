//============================================================================================================
//Program name: "bubblesort"
//              How to make an array, how to implement iteration, how to make professional looking programs,
//              how to reject invalid inputs, etc.
// File: bubblesort.cpp
// File Description: A simple sorting algorithm that works by comparing adjacent elements and swaps them 
//                      if they are in the wrong order. It passes through the list repeatedly until
//                      the list is sorted.
// This program is free software: you can redistribute it and/or modify it under the terms of the GNU
// General Public License version 3 as published by the Free Software Foundation.
// This program is distributed in hope that it will be useful, but WITHOUT ANY WARRANTy; without even the 
// implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
// for more details.
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/Licenses/> 
//============================================================================================================

#include <iostream>
using namespace std;

extern "C" int bubblesort (long int array[], long int size);
extern "C" void swap (long int* j , long int* k);

//Bubblesort
int bubblesort(long int array[], long int size)
{
  long int a, b;
  //For loop
   for (a = 0; a < size - 1; a++)
  {
    //2nd For loop
    for (b = 0; b < size - a - 1; b++)
    {
      //If statement
      if (array[b] > array[b + 1])
      {
        swap(&array[b], &array[b + 1]);
      } // End of if statement

    }//End of 2nd for loop

  } //End of for loop

  return array[size - 1]; // Returns the largest value in the array. 

}