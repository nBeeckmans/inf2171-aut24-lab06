	.eqv PrintChar 		11
	.eqv PrintInt 		1 
	.eqv PrintString	4 
	.eqv ReadChar		12
	.eqv ReadInt 		5
	.eqv ReadString		8
	.eqv Exit		10 
	
	.eqv TabLen		10 
	.eqv SizeOfElement	4 
.data 
tab:	.word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2
.text 
# inverser le tableau a l'utilisateur ! 
	
	la s0, tab 
	li s1, TabLen 
	addi s1, s1, -1 

loop :
	li t0, SizeOfElement
	mul t0, s1, t0
	
	add t0, s0, t0 
	
	lw a0, 0(t0)
	li a7, PrintInt
	ecall 

	li a0, ','
	li a7, PrintChar
	ecall 
	
	li a0, ' ' 
	ecall 
	
	addi s1, s1, -1 
	beqz s1, end_loop
	
	j loop
end_loop:
	# pour le premier element a imprimer 
	lw a0, 0(s0)
	li a7, PrintInt
	ecall 

	
exit : 
	li a7, 10
	ecall
