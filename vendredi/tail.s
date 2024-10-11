	.eqv PrintChar 		11
	.eqv PrintInt 		1 
	.eqv PrintString	4 
	.eqv ReadChar		12
	.eqv ReadInt 		5
	.eqv ReadString		8
	.eqv Exit		10 
	.eqv TabLen		20
.data 

buffer : .space TabLen 
.text 
	la s0, buffer 
	li s1, 0 
read: 
	# lire char 
	li a7, ReadChar 
	ecall 
	
	li t0, '\n' 
	li t1, -1 
	beq a0, t0, end_read 
	beq a0, t1, end_read 
	# mettre char dans tableau
	add t0, s0, s1 
	sb a0, 0(t0)

	addi s1, s1, 1 
	li t0, TabLen
	rem s1, s1, t0  
	j read 
end_read :
	mv s2, s1 

write : 
	add t0, s0, s1 
	lbu a0, 0(t0)
	li a7, PrintChar 
	ecall 
	
	addi s1, s1, 1 
	li t0, TabLen
	rem s1, s1, t0  
	beq s1, s2, end_write 

	j write 
end_write: 



exit : 
	li a7, 10
	ecall
