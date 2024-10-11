	.eqv PrintInt 		1
	.eqv PrintChar		11
	.eqv Exit 		10 
	
	.eqv sizeofelement	4
	.eqv sizeofligne 	16
	
	.eqv lignes 		3
        .eqv colonnes	 	4

.data
mat:    .word 11, 12, 13, 14
        .word 21, 22, 23, 24
        .word 31, 32, 33, 34
        # int[][] mat = new int[][];
        # int val = mat[2][3]
      	
.text 
	
	la s0, mat 
	li s1, lignes 
	li s2, colonnes 
	li s3, 0 
extern :
	li s4, 1 
	mv s5, s0  # s5 pointeur temporaire qui est egal a s0 
intern:
	li a7, PrintInt 
	lw a0, 0(s5)
	ecall 
	# 11 
	
	li a7, PrintChar 
	li a0, ',' 
	ecall 	
	
	li a0, ' ' 
	ecall 
	# 11, 

	addi s5, s5, sizeofligne # on decale le pointeur sur 21 
	
	addi s4, s4, 1   
	beq s4, s1, end_intern
	j intern  
end_intern: 
	li a7, PrintInt 
	lw a0, 0(s5)
	ecall 

	li a7, PrintChar 
	li a0, '\n'
	ecall 

	# TODO : deplacer s0 
	addi s0, s0, sizeofelement # on decale le pointeur sur 12 
	
	addi s3, s3, 1   
	beq s3, s2, end_extern
	j extern 
end_extern: 

exit : 
	li a7, Exit 
	ecall 