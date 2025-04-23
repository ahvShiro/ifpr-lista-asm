.data
vetor1: .word 1 2 3 4 5
vetor2: .word 5 4 3 2 1
vetor3: .word 0 0 0 0 0
n: .word 5
space: .asciiz " "

.text
main:
	la $t1, vetor1		# $t1 = &vetor1[0]
	la $t2, vetor2		# $t2 = &vetor2[0]
	la $t3, vetor3		# $t3 = &vetor3[0]
	
	lw $s0, n		# $s0 = n
	li $t0, 0		# $t0 = 0 (i)

loop_0:
	bge $t0, $s0, loop_0_end

	lw $t4, ($t1)		# $t4 = &vetor1[i]
	lw $t5, ($t2)		# $t5 = &vetor2[i]

	add $t6, $t4, $t5	# $t6 = vetor1[i] + vetor2[i]
	
	sw $t6, ($t3)		# vetor3[i] = $t6
	
	lw $a0, ($t3)		# carrega resultado no registro de impressão
	li $v0, 1		# carrega o código de impressão de inteiros
	syscall
	
	la $a0, space		# carrega space no registro de impressão
	li $v0, 4		# carrega o código de impressao de strings
	syscall

	addi $t1, $t1, 4	# vetor1[i + 1]
	addi $t2, $t2, 4	# vetor2[i + 1]
	addi $t3, $t3, 4	# vetor3[i + 1]
	
	addi $t0, $t0, 1	# i++
	
	b loop_0
	
loop_0_end:
	li $v0, 10		# carrega o codigo de encerramento de sistema
	syscall
	
	
