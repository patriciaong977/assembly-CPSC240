echo "The script file for Program Area of Triangle has begun"

echo "Assemble area.asm"
nasm -f elf64 -o area.o -l area.list area.asm

echo "Compile triangle.c"
gcc -c -Wall -m64 -no-pie -o triangle.o triangle.c -std=c11

echo "Compile isfloat.cpp"
g++ -c -Wall -m64 -std=c++14 -no-pie -o isfloat.o isfloat.cpp

echo "Link the object files"
g++ -m64 -no-pie -o executable.out -std=c11 area.o isfloat.o triangle.o

echo "Run the Program Area of Triangle: "
./executable.out

echo "The script file will terminate"
