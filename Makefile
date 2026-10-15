
# Compiler and assembler settings
NASM = nasm
CC = gcc
NASMFLAGS = -f elf -Isrc/
CFLAGS = -m32
LDFLAGS = -m32 -no-pie

# Programs to build
PROGRAMS = task1 task1_2 task2_1 task2_2 task2_3
TARGETS = $(addprefix src/,$(PROGRAMS))

# Default target: build everything
.PHONY: all clean
all: $(TARGETS)

# Assemble each task's .asm file
src/task%.o: src/task%.asm src/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

# Assemble the shared assembly library
src/asm_io.o: src/asm_io.asm src/asm_io.inc
	$(NASM) $(NASMFLAGS) $< -o $@

# Compile the C driver
src/driver.o: src/driver.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link each task with the shared files
src/%: src/%.o src/driver.o src/asm_io.o
	$(CC) $(LDFLAGS) $^ -o $@

# Remove generated files
clean:
	rm -f src/*.o $(addprefix src/,$(PROGRAMS))
