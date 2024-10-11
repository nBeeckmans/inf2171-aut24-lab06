	.eqv PrintChar 		11
	.eqv PrintInt 		1 
	.eqv PrintString	4 
	.eqv ReadChar		12
	.eqv ReadInt 		5
	.eqv ReadString		8
	.eqv Exit		10 
	
	.eqv lignes  		3		
        .eqv colonnes 		4
        .eqv SizeOfElement	4 	
.data 
mat:    .word 11, 12, 13, 14
        .word 21, 22, 23, 24
        .word 31, 32, 33, 34
.text 
	la s0, mat 
	
	li s1, 0 
	li s3, lignes
	li s4, colonnes 
extern_loop :
	li s2, 1
	mv s5, s0 
intern_loop:
	lw a0, 0(s5) 
	li a7, PrintInt
	ecall 
	
	li a0, ','
	li a7, PrintChar
	ecall 
	
	li a0, ' ' 
	ecall 
	
	li t0, 1 
	slli t0, t0, 4
	
	add s5, s5, t0 
	
	addi s2, s2, 1 
	beq s2, s3, end_intern_loop
	j intern_loop
end_intern_loop:

	lw a0, 0(s5) 
	li a7, PrintInt
	ecall 
	
	li a0, '\n'
	li a7, PrintChar 
	ecall 

	addi s0, s0, 4 
	
	addi s1, s1, 1 
	beq s4, s1, end_extern_loop
	j extern_loop
end_extern_loop:

exit : 
	li a7, 10
	ecall
