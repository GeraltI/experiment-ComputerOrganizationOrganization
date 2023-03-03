.data
number:
	.word 200110618

.text
START:
	addi 	sp,sp,-16#调整栈指针，分配空间
	sw 	ra,12(sp)#保存函数返回地址
	sw 	s2,8(sp)#保存s2寄存器，进制转换过程的数
	sw 	s3,4(sp)#保存s3寄存器，进制转换过程的数
	sw 	s4,0(sp)#保存s4寄存器，保存i
	la 	a4,number#a4 = &number首地址
	lw	s3,0(a4)#a4 = 无符号数学号
	jal	ra,SEGMENT10_2#将下一条指令的地址保存在ra中，跳转到目标地址LOOP
SEGMENT10_2:
	andi	a4,s3,1#若s3保存的数是奇数则a4置1，否则置0
	slli	s2,s2,1#s2保存的数逻辑左移一位
	add	s2,s2,a4#将余数a4填入s2寄存器最后一位
	srli	s3,s3,1#s3保存的数逻辑右移一位
	addi	s4,s4,1#i = i + 1
	beqz 	s3,SEGMENT2_16#如果s3寄存器保存的值被除尽了则跳出LOOP10_2循环，进入LOOP2_16循环
	jalr 	zero,ra,-4
SEGMENT2_16:
	andi	a4,s2,1#若s2保存的数是奇数则a4置1，否则置0
	slli	s3,s3,1#s3保存的数逻辑左移一位
	add	s3,s3,a4#将余数a4填入s3寄存器最后一位
	srli	s2,s2,1#s2保存的数逻辑右移一位
	li	a4,1#a4 = 1
	sub	s4,s4,a4#i = i - 1
	beqz 	s4,EXIT#如果s4寄存器保存的值为0(i = 0)，则跳出LOOP2_16循环，进入EXIT
	jal	ra,SEGMENT2_16
EXIT:

                            
	
