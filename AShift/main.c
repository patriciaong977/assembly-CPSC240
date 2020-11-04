//Patricia Ong
//CPSC 240-1 Midterm Program


#include "stdio.h"

//Manager return is long int
long int manager();

int main()
{
    long int result_code = -999;
    
    //Prints 1st line
    printf("%s", "Welcome to the 2:30 midterm by Patricia Ong \n");    
    //Prints 2nd line
    printf("%s", "The array manager will begin. \n");

    //Get result_code from the manager function
    result_code = manager();

    //Print Last two lines of the Prompt
    printf("%s%ld%s\n", "The driver received, ", result_code, " and doesn't know what to do with it. \n");
    printf("%s", "Have a nice day. \n");
    
    return 0;
}
