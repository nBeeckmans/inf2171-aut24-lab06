	.eqv PrintInt	 	1
	.eqv PrintChar 		11 
	.eqv Exit 		10
	.eqv lignes 		3			
	.eqv colonnes 		4
	.eqv sizeofelement 	4
	.eqv sizeofpointeur	8 #dword pour l1, l2, l3
				
.data
l1:	.word 11, 12, 13, 14
l2:	.word 21, 22, 23, 24
l3:	.word 31, 32, 33, 34
mat:	.dword l1, l2, l3


.text
# i de 0 a 3 (colonnes)
#   j de 0 a 2 (lignes)
#       | t = dereferencer mat en fonction de j 
#	| q = dereferencer lx  en fonction de i
# 	| imprimer q 


	la s0, mat 
	li s1, 0 	# i 
	li s4, 0 	# decalage a appliquer dans boucle interne 
extern : 
	li s2, 1	# j 
	mv s3, s0	# s3 == pointeur tmp 
intern:
	ld t0, 0(s3) 
	add t0, t0, s4 
	lw a0, 0(t0)
	
	li a7, PrintInt 
	ecall 
	
	li a7, PrintChar
	li a0, ','
	ecall
	
	addi s3, s3, sizeofpointeur 
	
	addi s2, s2, 1 
	li t0, lignes 
	beq s2, t0, end_intern 
	j intern 
end_intern:

	ld t0, 0(s3) 
	add t0, t0, s4 
	lw a0, 0(t0)
	
	li a7, PrintInt 
	ecall 
	
	li a7, PrintChar 
	li a0, '\n'
	ecall 
	addi s4, s4, sizeofelement 
	
	addi s1, s1, 1 
	li t0, colonnes 
	beq s1, t0, end_extern
	j extern
end_extern :
	li a7, Exit 
	ecall
    
