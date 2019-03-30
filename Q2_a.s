# MIPS program to calculate nth Fibonacci number.
	.data
n:	.word	9
num:	.word	0
	.text

main:
	lw $a0, n
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal fibonacci

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	sw $v0, num
	jr $ra
.end main

fibonacci:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)

	add $s0, $a0, $zero
	li $v0, 1 
	ble $s0, 2, Exit

	addi $a0, $s0, -1
	jal fibonacci
	add $s1, $v0, $zero

	addi $a0, $s0, -2 
	jal fibonacci
	add $v0, $s1, $v0 

Exit:
	bgt $s0, 0, not_zero
	li $v0, 0
not_zero:
	lw $ra, 8($sp)
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $sp, $sp, 12
	jr $ra
