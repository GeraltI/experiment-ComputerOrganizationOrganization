.data
number:
	.word 200110618

.text
START:
	addi 	sp,sp,-16#����ջָ�룬����ռ�
	sw 	ra,12(sp)#���溯�����ص�ַ
	sw 	s2,8(sp)#����s2�Ĵ���������ת�����̵���
	sw 	s3,4(sp)#����s3�Ĵ���������ת�����̵���
	sw 	s4,0(sp)#����s4�Ĵ���������i
	la 	a4,number#a4 = &number�׵�ַ
	lw	s3,0(a4)#a4 = �޷�����ѧ��
	jal	ra,SEGMENT10_2#����һ��ָ��ĵ�ַ������ra�У���ת��Ŀ���ַLOOP
SEGMENT10_2:
	andi	a4,s3,1#��s3���������������a4��1��������0
	slli	s2,s2,1#s2��������߼�����һλ
	add	s2,s2,a4#������a4����s2�Ĵ������һλ
	srli	s3,s3,1#s3��������߼�����һλ
	addi	s4,s4,1#i = i + 1
	beqz 	s3,SEGMENT2_16#���s3�Ĵ��������ֵ��������������LOOP10_2ѭ��������LOOP2_16ѭ��
	jalr 	zero,ra,-4
SEGMENT2_16:
	andi	a4,s2,1#��s2���������������a4��1��������0
	slli	s3,s3,1#s3��������߼�����һλ
	add	s3,s3,a4#������a4����s3�Ĵ������һλ
	srli	s2,s2,1#s2��������߼�����һλ
	li	a4,1#a4 = 1
	sub	s4,s4,a4#i = i - 1
	beqz 	s4,EXIT#���s4�Ĵ��������ֵΪ0(i = 0)��������LOOP2_16ѭ��������EXIT
	jal	ra,SEGMENT2_16
EXIT:

                            
	
