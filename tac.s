# Lit jusqu'à 20 lignes et les affiche en commencant par la dernière.

.data
	# Appels systmème utilisés
	.eqv PrintString, 4
	.eqv ReadString, 8
	.eqv Exit, 10
	
	.eqv maxLine, 81 # espace pour chaque ligne. 80 + 1 pour '\0'
l00:	.space maxLine
l01:	.space maxLine
l02:	.space maxLine
l03:	.space maxLine
l04:	.space maxLine
l05:	.space maxLine
l06:	.space maxLine
l07:	.space maxLine
l08:	.space maxLine
l09:	.space maxLine
l10:	.space maxLine
l11:	.space maxLine
l12:	.space maxLine
l13:	.space maxLine
l14:	.space maxLine
l15:	.space maxLine
l16:	.space maxLine
l17:	.space maxLine
l18:	.space maxLine
l19:	.space maxLine
	.eqv maxLines, 20
lignes:	.dword l00, l01, l02, l03, l04, l05, l06, l07, l08, l09, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19

.text 

# lire les lignes : 
	la s0, lignes
	li s1, 0
	li a7, ReadString
	li a1, maxLine
read : 
	ld a0, 0(s0)
	
	ecall 
	
	# condition si \0 ou \n 
	lb t0, 0(a0)	
	
	li t1, '\n'
	li t2, '\0'
	beq t0, t1, end_read
	beq t0, t2, end_read
	
	# condition si 20 lignes 
	addi s1, s1, 1
	li   t1, maxLine
	beq  s1,t1, end_read 
	
	addi s0, s0, 8 # taille dword 
	j read 
end_read: 

	la s0, lignes
	addi s1, s1, -1  # compteur de lignes lues - 1 donne indice :) 
	slli t0, s1, 3   # s1 * 8 -> ex 5 phrases =>  (4 - 1 ) * 8 de decalage
	add s0, s0, t0  
	li a7, PrintString 
	ebreak 
write : 
	ld a0, 0(s0)
	ecall 
	
	addi s0, s0, -8
	la t0, lignes 
	blt s0, t0, end_write 
	
	j write 
end_write :

exit :  
	li a7, Exit
	ecall 
