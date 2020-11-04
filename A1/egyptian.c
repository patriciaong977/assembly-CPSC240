//******************************************************************************************************************************
// California State University, Fullerton, hereby disclaims all copyright interest 
//      in the program "Circumference of Circle"  (which calculates the circumference of a circle) 
//      written by Patricia Ong.  
//
// Name: Patricia Ong
// Program name: Circumference of Circle
//            A program that will compute the approximate circumference of a circle using only integers.
//                Pi = 3.14 = 22/7 
//                Circumference = 2 * pi (22/7) * radius
//  Class: CPSC 240-1
//       For Submission.
//******************************************************************************************************************************

#include <stdio.h>
#include <stdint.h>

long int circle();

int main()
{
    
    long int result_code = -999;
 
    printf("Welcome to your friendly circle circumference calculator. \n");
    printf("The main program will now call the circle function. \n");

    result_code = circle();

    printf("%s%ld\n", "The main received this integer ", result_code);
    printf("Have a nice day. Main will now return 0 to the operating system.\n");
    return 0;

}