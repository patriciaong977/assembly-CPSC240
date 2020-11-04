#echo "The script file for Assignment #2 has begun"

#echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

#echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

#echo "Assemble sum.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

#echo "Assemble atol.asm" ;
nasm -f elf64 -l atol.lis -o atol.o atol.asm

#echo "Compile isinteger.cpp" ;
g++ -c -Wall -m64 -std=c++14 -no-pie -o isinteger.o isinteger.cpp

#echo "Compile display_array.cpp"
g++ -c -Wall -m64 -std=c++14 -no-pie -o display_array.o display_array.cpp

#echo "Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

#echo "Link the object files"
gcc -m64 -no-pie -o array.out -std=c11 manager.o main.o input_array.o display_array.o sum.o atol.o isinteger.o 

#echo "Run the program Array Example:"
./array.out
