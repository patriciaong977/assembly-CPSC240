echo "The script file for Program The Harmonic Sum has begun"


echo "Assemble manager.asm"
nasm -f elf64 -o manager.o -l manager.list manager.asm

echo "Assemble read_clock.asm"
nasm -f elf64 -o read_clock.o -l read_clock.list read_clock.asm


echo "Compile main.cpp"
g++ -c -Wall -m64 -std=c++14 -no-pie -o main.o main.cpp


echo "Link the object files"
g++ -m64 -no-pie -o executable.out -std=c11 manager.o read_clock.o main.o

echo "Run the Program Area of Triangle: "
./executable.out

echo "The script file will terminate"