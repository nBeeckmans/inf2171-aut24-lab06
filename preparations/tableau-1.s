	.eqv Exit 	10 
	.eqv PrintInt 	1
	.eqv PrintChar	11
	.eqv TabLen 	10
	.eqv SizeOf 	4
.data 
tab : 	.word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2
.text 
	la s0, tab 
	li s1, TabLen	# 10 elements dans le tableau
	addi s1, s1, -1	# 9 indices dans le tableau
loop :
	slli t0, s1, 2 	# ex s1=10, t0 = 40 (40 octets)
	add  t1, s0, t0 # addresse + decalage -> pointeur sur element
	
	lw a0, 0(t1)
	li a7, PrintInt
	ecall
	
	li a0, ','
	li a7, PrintChar
	ecall 
	
	addi s1, s1, -1 
	beqz s1, end_loop # si on tombe a indice 0 -> imprime dernier int   
	j loop
end_loop: 
	lw a0, 0(s0)
	li a7, PrintInt
	
	# pas de virgule pour le dernier char :) 
	ecall
	li a7, 10 
	ecall 
