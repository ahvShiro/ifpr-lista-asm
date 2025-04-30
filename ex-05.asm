# Ex. 5. Fazer um código assembly que escreva na memória primária um vetor 
# contendo a sequência dos quadrados perfeitos de 1 até n, sendo n uma 
# variável na memória. O valor do quadrado perfeito deverá ser calculado 
# pelo código em execução.

# Deverá também escrever uma saída no terminal contendo:
# 1 - 1
# 2 - 4
# 3 - 9
# n - n2


.data

vetor: .word 0 0 0 0 0 0 0 0 0 0
n: .word 10
separador: .asciiz " - "
newline: .asciiz "\n"


.text
main:
	li $t0, 1		# i = 1
	la $t1, separador	# $t1 = separador
	
	lw $s0, n
	la $s1, vetor

loop_0:
	bgt $t0, $s0, loop_0_end	# Loop
	mul $t2, $t0, $t0		# quadrado de i

		
	move $a0, $t0		# move i pra $a0
	li $v0, 1		# codigo 1 pra impressao
	syscall
	
	la $a0, separador	# carrega separador em $a0
	li $v0, 4		# código 4 no $v0
	syscall
	
	move $a0, $t2		# carrega o quadrado 		
	li $v0, 1		# código 1 no $v0
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	
	sw $t2, ($s1)		# salva no vetor
	
	addi $s1, $s1, 4	# vai pro próximo valor
	addi $t0, $t0, 1
	
	b loop_0
	
loop_0_end:
	li $v0, 10
	syscall
