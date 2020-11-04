echo "The script file for Program Integer Arithmetic has begun"

echo "Assemble main.asm"
nasm -f elf64 -o circle.o -l circle.lis circle.asm

echo "Compile driver.c"
gcc -c -Wall -m64 -no-pie -o egyptian.o egyptian.c -std=c11

echo "Link the object files"
gcc -m64 -no-pie -o executable.out -std=c11 circle.o egyptian.o

echo "Run the program Integer Arithmetic:"
./executable.out

echo "The script file will terminate"