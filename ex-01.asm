# Ex. 1. Elabore um código assembly que calcule o resultado da seguinte somatória, onde n deverá ser especificado em um registrador.
#Imprimir o resultado usando chamadas de sistema.

# r = somatória de todos os números i entre i = 0 e n

# n = 5
# r = 0 + 1 + 2 + 3 + 4 + 5
# r = 15


# Parte que vai guardar dados na memória
.data


# Parte que vai guardar o programa
.text 

# Label: nome que refencia um endereço de memória
main:
	li $s0, 0	# r => $s0 = 0
	li $t0, 0	# i => $t0 = 0
	li $t1, 5	# n => $t1 = 5
	
loop_0:
	bgt $t0, $t1, loop_0_end	# Branch se i for maior que n
	add $s0, $s0, $t0		# r = r + i
	addi $t0, $t0, 1		# i++
	b loop_0			# Volta pro começo do label
	
loop_0_end:
	li $v0, 1	# Coloca o código 1 no registro $v0 pra imprimir
	move $a0, $s0	# Move o integer a ser impresso no $a0
	syscall		# Chama o sistema 
	
	li $v0, 10	# Coloca o código 10 no registro $v0 para sair
	syscall		# Chama o sistema
	
	
