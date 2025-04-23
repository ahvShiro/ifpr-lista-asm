.data
vetor: .word 1 2 3 4 5 6 7
n: .word 7
media: .word 0

qt_acima: .word 0
qt_abaixo: .word 0

msg_media: .asciiz "média: "
msg_maior: .asciiz "; qt de elementos acima da media: "
msg_menor: .asciiz "; qt de elementos abaixo da media: "


.text
main:
	li $t0, 0	# i = 0
	la $t1, vetor	# $t1 = &vetor[0]
	lw $t2, n	# $t2 = n
	lw $s0, media	# $s0 = media
	lw $s1, qt_acima
	lw $s2, qt_abaixo
	
loop_0:
	bge $t0, $t2, loop_0_end
	
	lw $t3, ($t1)		# carrega o valor de vetor[i] em $t3
	add $s0, $s0, $t3	# media = media + valor carregado
	
	addi $t1, $t1, 4	# vetor[i + 1]
	addi $t0, $t0, 1	# i++
	
	b loop_0
	
loop_0_end:
	divu $s0, $s0, $t2	# soma de todos os elementos / qt elementos
	sw $s0, media		# salva o resultado em media
	
	li $t0, 0		# reset dos valores
	la $t1, vetor
	
	b loop_1
	
loop_1:
	bge $t0, $t2, loop_1_end
	
	lw $t3, ($t1)			# carrega o valor de vetor[i] em $t3
	
	bgt $t3, $s0, caso_maior	# se o valor carregado for maior que a média, branch pra caso_maior
	blt $t3, $s0, caso_menor	# se o valor carregafo for menor que a média, branch pra caso_menor
	
	addi $t1, $t1, 4	# vetor[i + 1]
	addi $t0, $t0, 1	# i++
	
	b loop_1

caso_maior:
	add $s1, $s1, 1		# soma 1 no contador de maiores
	sw $s1, qt_acima
	
	addi $t1, $t1, 4	# vetor[i + 1]
	addi $t0, $t0, 1	# i++
	
	b loop_1		# volta pro loop_1

caso_menor: 
	add $s2, $s2, 1		# soma 1 no contador de menores
	sw $s2, qt_abaixo
	
	addi $t1, $t1, 4	# vetor[i + 1]
	addi $t0, $t0, 1	# i++
	
	b loop_1		# volta pro loop_1

loop_1_end:

	li $v0, 4		# Coloca o código 4 no registro $v0 pra imprimir string
	la $a0, msg_media	# Move a string a ser impressa no $a0
	syscall	
	
	li $v0, 1		
	move $a0, $s0		# Impime a média
	syscall
	
	li $v0, 4		
	la $a0, msg_maior
	syscall
	
	li $v0, 1		
	move $a0, $s1		# Impime a qt de elementos acima da media
	syscall
	
	li $v0, 4
	la $a0, msg_menor
	syscall	
	
	li $v0, 1		
	move $a0, $s2		# Impime a qt de elementos abaixo da media
	syscall		 
	
	li $v0, 10		# Encerra o programa
	syscall
