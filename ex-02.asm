# Ex. 2. Dado um vetor na memória com n elementos, elabore um código assembly que calcule o resultado da seguinte somatória, onde n deverá ser especificado na memória. Imprimir o resultado usando chamadas de sistema.

.data

n: .word 6
r: .word 0
vetor: .word 1 2 3 4 5 6
msg: .asciiz "A resposta é: "


.text

main:
	lw $t0, n	# n => $t0 = n
	li $t1, 0	# i =>
	li $s0, 0	# r
	la $t2, vetor	# $t2 = &vetor[0]
	
loop_0:
	bge $t1, $t0, loop_0_end	# Encerra o loop se i > n
	lw $t3, ($t2)			# Guarda o valor do endereço naquela posição do vetor
	add $s0, $s0, $t3 		# r = r + vetor[i]
	addi $t2, $t2, 4		# Vai pro próximo item do vetor
	addi $t1, $t1, 1		# i++
	b loop_0
	
loop_0_end:
	sw $s0, r	# Salva o conteúdo de $s0 em r
	
	li $v0, 4	# Coloca o código 4 no registro $v0 pra imprimir string
	la $a0, msg	# Move a string a ser impresso no $a0
	syscall		# Chama o sistema 
	
	li $v0, 1	# Coloca o código 1 no registro $v0 pra imprimir
	move $a0, $s0	# Move o integer a ser impresso no $a0
	syscall		# Chama o sistema 
	
	li $v0, 10	# Coloca o código 10 no registro $v0 para sair
	syscall		# Chama o sistema