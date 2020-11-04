#echo "The script file for Assignment #2 has begun"

#echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

#echo "Assemble input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

#echo "Assemble sum.asm"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

#echo "Assemble atol.asm" ;
nasm -f elf64 -l atol.lis -o atol.o atol.asm

#echo "Assemble read_clock.asm"
nasm -f elf64 -l read_clock.lis -o read_clock.o read_clock.asm

#echo "Assemble swap.asm"
nasm -f elf64 -l swap.lis -o swap.o swap.asm



#echo "Compile isinteger.cpp" ;
g++ -c -Wall -m64 -std=c++14 -no-pie -o isinteger.o isinteger.cpp

#echo "Compile display_array.cpp"
g++ -c -Wall -m64 -std=c++14 -no-pie -o display_array.o display_array.cpp

#echo "Compile bubblesort.cpp"
g++ -c -Wall -m64 -std=c++14 -no-pie -o bubblesort.o bubblesort.cpp



#echo "Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

#echo "Compile bubblesort.c"
#gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11


#echo "Link the object files" (Can be g++ or gcc)
g++ -m64 -no-pie -o array.out -std=c11 manager.o main.o input_array.o display_array.o sum.o atol.o isinteger.o read_clock.o swap.o bubblesort.o  

#echo "Run the program Array Example:"
./array.out
