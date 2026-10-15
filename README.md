# OS-labs
# operating systems- worksheet 1

## task 1: adding two integers

This program uses x86 assembly to add two integers stored in memory and print the result.

### part 1: output

![Task1 program output](screenshots/task1.png)

### part 2: Adding two user-input integers

This program extends Task1.1 by allowing te user to input two integers rather than using predefined values. The program adds the integers together and displays the calculation anmd result.

#### Reading user input

mov eax, msg1
call print_string
call read_int
mov [integer1], eax

The print_string function displays a prompt asking the user to enter a number. The read_int function reads the user's input and stores it in the EAX register. The value is then moved into the integer1 memory location. This process is repeated for the second integer.

#### Calculating the sum

mov eax, [integer1]
add eax, [integer2]
mov [result], eax

The first integer is loaded into EAX, the second integer is added to it, and the result is stored in memory.

#### Displaying the result

The program uses print_string to display text and print_int to display the entered integers and their sum. Unlike Task 1.1, which only displays the result, Task 1.2 shows the full calculation.

#### Testing and output

The program was tested with the inputs 15 and 6, producing the expected result of 21. 

![Task 1 part 2 output](screenshots/task1_2.png)

## task 2: loops and arrays

### part 1: welcome messgae

This program asks for the user's name and a number between 51 and 99, then prints a welcome message that many times. 

### part 2: summing an array 

This program initialises an array with the integers 1 to 100 and calculates their sum using a loop. The expected result is 5050.

#### Why does ESI start at zero?:

The ESI register is used as an index to access elements in the array. It starts at zero because the first element of an array is at index 0. After each iteration, ESI is incremented by one to access the next element, until all 100 elements have been processed.

#### Why is each array index multiplied by four?

Each integer in the array is stored as a doubleword (resd), which occupies 4 bytes of memory. Therefore, the index must be multiplied by four to calculate the correct memory address of each element.

For example:

Index 0 → byte offset 0

Index 1 → byte offset 4

Index 2 → byte offset 8

The instruction mov [numbers + esi*4], eax uses this calculation to store each integer in the correct array position.

#### How does ECX control the loops?

The ECX register acts as a loop counter. It is initially set to 100 because the array contains 100 elements.

The loop instruction automatically decreases ECX by one after each iteration and jumps back to the specified label if ECX is not zero.

The program uses two loops:

1. fill_array — stores the numbers 1 to 100 in the array.

2. sum_array — reads each element and adds its value to the running total stored in EBX.

Before the second loop, ECX is reset to 100 so that all elements are processed again. Once the second loop finishes, the total is moved into EAX and displayed using print_int.

Result: The program successfully calculates and outputs the sum of the integers from 1 to 100, which is 5050.

### output

![Task 2 Part 2 program output](screenshots/task2p2.png)
