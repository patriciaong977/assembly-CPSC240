#echo "The script file for Electricity Progam has begun"

#echo "Assemble manager.asm"
nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm

#echo "Assemble read_clock.asm"
nasm -f elf64 -l read_clock.lis -o read_clock.o read_clock.asm

#echo "Assemble Compute_Resistance.asm"
nasm -f elf64 -l Compute_Resistance.lis -o Compute_Resistance.o Compute_Resistance.asm

#echo "Assemble Input_Resistance.asm"
nasm -f elf64 -l Input_Resistance.lis -o Input_Resistance.o Input_Resistance.asm


#echo "Compile Display_Resistance.cpp"
g++ -c -Wall -m64  -fno-pie -no-pie -o Display_Resistance.o Display_Resistance.cpp

#echo "Compile Display_Resistance.cpp"
g++ -c -Wall -m64  -fno-pie -no-pie -o isfloat.o isfloat.cpp

#echo "Compile Electricity.cpp"
g++ -c -Wall -m64  -fno-pie -no-pie -o Electricity.o Electricity.cpp


#echo "Link the object files"
g++ -m64 -fno-pie -no-pie -o exe.out  Electricity.o isfloat.o Display_Resistance.o Input_Resistance.o Compute_Resistance.o read_clock.o Manager.o

#echo "Run the program Electricity Program Example:"
./exe.out

rm *.o
rm *.lis