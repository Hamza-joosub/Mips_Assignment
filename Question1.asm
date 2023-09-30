.data
filename: .asciiz "jet_64_in_ascii_cr.ppm"  # Replace with your file name
openError: .asciiz "cant open File"
buffer: .space 1


.text
.globl main

main:
    # Open the file for reading
    li $v0, 13            # System call code for open file
    la $a0, filename      # Load the file name into $a0
    li $a1, 0            # Flags: 0 for reading
    syscall
    move $s0, $v0
    li $s1, 0


    # Read and print lines from the file
read_loop:
    # Read a character from the file
    li $v0, 14            # System call code for read character
    move $a0, $s0         # File descriptor in $a0
    la $a1, buffer	  # Buffer address (assuming it's on the stack)
    li $a2, 1      	  # Read one character
    syscall 
    beq $v0, $zero, print_loop
    lb $t0, buffer
    sb $t0, ($sp)
    addi $sp, $sp, -1
    j read_loop
print_loop:
    li $v0, 4 
    la $a0, ($sp)
    addi $sp, $sp, 1
    syscall
convert_to_int:
la $t0, StringNumber
li $s1, 10
li $s2, 100
lb $t2, 1($t0)
lb $t1, 2($t0)
lb $t5, ($t0)
subi $t3, $t1, 48
subi $t4, $t2, 48
subi $t5, $t5, 48
mul $t4, $t4, $s1
mul $t5, $t5, 100
add $s0, $t4, $t3
add $s0, $s0, $t5

    # Check for end of file (EOF)
    #beq $v0, $zero, file_end

    # Print the character to console
    #li $v0, 11            # System call code for print character
    #move $a0, $t0         # Character to print
    #syscall

    # Check for newline character (ASCII 10)
   # beq $t0, 10, newline_found

    # Continue reading characters
    #j read_loop

#newline_found:
    # Print a newline character to console
    #li $v0, 11            # System call code for print character
   # li $a0, 10            # ASCII code for newline
    #syscall
   # jr $ra

#file_end:
    # Close the file
    #li $v0, 16            # System call code for close file
    #move $a0, $v0         # File descriptor in $a0
    #syscall

    # Exit the program
    #li $v0, 10            # System call code for exit
    #syscall


    # Exit the program
    li $v0, 10            # System call code for exit
    syscall
