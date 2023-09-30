.text
.globl main

main:
la $t0, StringNumber
li $t1, 0
j count_num_of_characters


done:
beq $t1, 2, convert_to_int_2_digits
beq $t1, 3, convert_to_int_3_digits
beq $t1, 1, convert_to_int_1_digit

count_num_of_characters:
lb $a0,($t0)
beqz $a0,done
addi $t0,$t0,1
addi $t1,$t1,1
j     count_num_of_characters 

convert_to_int_1_digit:
la $t0, StringNumber
lb $t1, ($t0)
subi $t1, $t1, 48
move $s0, $t1
addi $s0, $s0, 10
li $v0, 1
move $a0, $s0
syscall
li $v0, 10
syscall


convert_to_int_2_digits:
la $t0, StringNumber
li $s1, 10
lb $t2, ($t0)
lb $t1, 1($t0)
subi $t3, $t1, 48
subi $t4, $t2, 48
mul $t4, $t4, $s1
add $s0, $t4, $t3
add $s0, $s0, 10
li $v0, 1
move $a0, $s0
syscall
li $v0, 10
syscall

convert_to_int_3_digits:
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
bge  $s0, 246, true
add $s0, $s0, 10
li $v0, 1
move $a0, $s0
syscall
li $v0, 10
syscall
true:
li $s0, 255
li $v0, 1
move $a0, $s0
syscall
li $v0, 10
syscall



.data
StringNumber: .asciiz "255"