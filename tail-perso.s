# Queue 
	.eqv PrintString 	4 
	.eqv ReadChar  		12
	.eqv Exit 		10
	.eqv BufSize		20
.data 
buffer:	.space BufSize 
	.word 0 
.text

# lire jusqu'a \n ou \0 dans tableau circulaire 
	la s0, buffer 
	li s1, 0  
	li a7, ReadChar
loop_read: 
	ecall 
	
	li t0, '\n'
	li t1, '\0'
	
	beq a0, t0, fin_read
	beq a0, t1, fin_read
	
	xor t0, t0, t0 
	add t0, s0, s1 
	
	sb a0, 0(t0)
	
	addi s1, s1, 1
	
	li t0, BufSize
	rem  s1, s1, t0
	
	j loop_read 
fin_read : 

# ecrire jusqu'a \0 ou fin de BufSize 
#	li a7, PrintString 
#	mv a0, s0
#	ecall
# marche pas -> donne  "adipiscing elitetur "