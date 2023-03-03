.text
  START:
 	addi	sp,sp,-12
 	sw	s2,8(sp)
 	sw	s3,4(sp)
 	sw	s4,0(sp)
 	li	s2,1#f(n-1)
 	li	s3,1#f(n)
 	li	s4,2#n
 	jal	ra,LOOP
 LOOP:
 	addi	a4,s3,0#a4 = f(n)
 	add	s3,s2,s3#f(n) = f(n-2) + f(n-1)
 	addi	s2,a4,0
 	addi	s4,s4,1
 	li	a4,20
 	beq	s4,a4,EXIT
 	jalr	zero,ra,-4
 EXIT:
 	
