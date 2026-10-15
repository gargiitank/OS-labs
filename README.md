# OS-labs
# operating systems- worksheet 1

## task1 1: adding two integers

This program uses x86 assembly to add two integers stored in memory and print the result.

### output

![Task1 program output](screenshots/task1.png)

## task 2: loops and arrays

### part 1: welcome messgae

This program asks for the user's name and a number between 51 and 99, then prints a welcome message that many times. 

### part 2: summing an array 

This program initialises an array with the integers 1 to 100 and calculates their sum using a loop. The expected result is 5050.

Why does ESI start at zero?:

The ESI register is used as an index to access elements in the array. It starts at zero because the first element of an array is at index 0. After each iteration, ESI is incremented by one to access the next element, until all 100 elements have been processed.

Why is each array index multiplied by four?

Each integer in the array is stored as a doubleword (resd), which occupies 4 bytes of memory. Therefore, the index must be multiplied by four to calculate the correct memory address of each element.

For example:

Index 0 → byte offset 0

Index 1 → byte offset 4

Index 2 → byte offset 8

The instruction mov [numbers + esi*4], eax uses this calculation to store each integer in the correct array position.

How does ECX control the loops?

The ECX register acts as a loop counter. It is initially set to 100 because the array contains 100 elements.

The loop instruction automatically decreases ECX by one after each iteration and jumps back to the specified label if ECX is not zero.

The program uses two loops:

fill_array — stores the numbers 1 to 100 in the array.

sum_array — reads each element and adds its value to the running total stored in EBX.

Before the second loop, ECX is reset to 100 so that all elements are processed again.

Once the second loop finishes, the total is moved into EAX and displayed using print_int.

Result: The program successfully calculates and outputs the sum of the integers from 1 to 100, which is 5050.

### output

![Task 2 Part 2 program output](image.png)
