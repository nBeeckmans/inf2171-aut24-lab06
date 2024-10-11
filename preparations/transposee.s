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
      	
.text 
	la s0, mat  	# adresse du mot a ecrire 
	li s1, lignes
	li s2, 0
	li s3, colonnes 

extern :
	li s4, 0
	mv s5, s0 
intern: 
	lw a0, 0(s5)
	li a7, PrintInt
	ecall 
	
	li a7, PrintChar 
	li a0, ','
	ecall 
	
	addi s5, s5, sizeofligne
	
	li t0, lignes 
	addi t0, t0, -1
	addi s4, s4, 1
	beq t0, s4, end_intern 
	j intern
end_intern: 
	lw a0, 0(s5)
	li a7, PrintInt
	ecall 

	li a7, PrintChar 
	li a0, '\n' 
	ecall 

	addi s0, s0, sizeofelement
	li t0, colonnes
	addi s2, s2, 1 
	beq s2, t0, end_extern 
	j extern
end_extern :
	li a7, Exit 
	ecall 
