# MIPS program to implement procedures.
	.data
k:	.word	2
l:	.word	5
m:	.word	36
n:	.word	2
result:	.word	0
error:	.asciiz	"Overflow occured. Enter valid integers"

	.text	
main:
	lw $s0, k
	lw $s1, n
	lw $a0, l
	lw $a1, m
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal mult_fun

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	div $s2, $v0, $s1
	add $s3, $s2, $s0
	sw $s3, result
	jr $ra
.end main

mult_fun:
	mult $a0, $a1
	mfhi $v1
	mflo $v0
	beq $v1, $zero, small_product
	li $v0, 4
	la $a0, error
	syscall

	li $v0, 10
	syscall
small_product:
	jr $ra
