	.eqv PrintString 	4 
	.eqv PrintChar		11
	.eqv ReadChar  		12
	.eqv Exit 		10
	
	.eqv BufSize		20
.data 
buffer:	.space BufSize    	# tableau circulaire 
.text

# lire des characteres 
	la s0, buffer 
	li s1, 0 
read :
	# lire character 
	# si \n -> quitter 
	li a7, ReadChar 
	ecall
	li t0, '\n'  
	li t1, '\0'
	beq a0, t0, end_read 
	beq a0, t1, end_read 
	
	add t0, s0, s1 
	sb a0, 0(s0) 
	
	addi s1, s1, 1 
	li t0, BufSize
	rem s1, s1, t0
	j read 
end_read:

	li a7, PrintString 
	la a0, buffer 
	ecall  


exit : 
	li a7, Exit 
	ecall 