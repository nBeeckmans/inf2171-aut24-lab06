	.eqv Exit 	10 
	.eqv PrintInt 	1
	.eqv PrintChar	11
	.eqv TabLen 	10 
	.eqv SizeOf 	4  	# fonction en c sizeof(type)
.data 
tab : 	.word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2
.text 
	la s0, tab 
	li s1, TabLen
	addi s1, s1, -1 
loop :

	# slli t0, s1, 2   	# slli multiplie par puis de 2 -> 2^2 = 4 
	li t0, SizeOf
	mul t0, s1, t0
	# t0 -= decalage 
	
	# xor 
	# A B	C
	# V V   F
	# V F   V
	# F V   V
	# F F   F
	xor t1,t1,t1 
	add t1, s0, t0 
	# on a un pointeur sur le dernier element
	
	lw a0, 0(t1) 
	li a7, PrintInt 
	ecall 
	
	li a7, PrintChar
	li a0, ','
	ecall 
	
	addi s1, s1, -1 
	beqz s1, end_loop
	j loop 
end_loop:
	li t0, SizeOf
	mul t0, s1, t0
	
	xor t1,t1,t1 
	add t1, s0, t0 
	
	lw a0, 0(t1) 
	li a7, PrintInt 
	ecall 
exit : 
	li a7, Exit 
	ecall 