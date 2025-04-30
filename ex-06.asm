.data
vetor: .word 4 2 10 3 2 99 2 5 11 12
n: 10

.text

main:
	la $s0, vetor	# vetor
	lw $s1, n	# tamanho do vetor
	li $t0, 0	# i
	li $t1, 0	# resultado 

loop_0:
	bl
	lw $t2, ($s0) 	# $t2 = valor de vetor[i]
	bgt $t
	
loop_1:
	
	