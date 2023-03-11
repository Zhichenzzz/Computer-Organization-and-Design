.data 
a:
.word 0
n:
.word 8
.text 
	li s0 1
	li s1 2
	la t1 a
	lw t0 n
	addi s3 t0 0
	addi t0 t0 -2
	beq s3 s0 fo
	beq s3 s1 ft
loop:
	add s2 s1 s0
	addi t0 t0 -1
	addi s0 s1 0
	addi s1 s2 0
	beq zero t0 ft
	jal a0 loop
ft:
	sw s1 (t1)
	jal a0 exit
fo:
	sw s0 (t1)
exit:
	
