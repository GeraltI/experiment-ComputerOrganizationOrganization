	.file	"hello.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%LLd"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,18
	sd	a5,-24(s0)
	ld	a0,-24(s0)
	call	cube
	mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.align	1
	.globl	cube
	.type	cube, @function
cube:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	mv	a5,a0
	sw	a5,-52(s0)
	lw	a5,-52(s0)
	sw	a5,-20(s0)
	lw	a5,-52(s0)
	sd	a5,-32(s0)
	sd	zero,-40(s0)
	sw	zero,-44(s0)
	j	.L4
.L6:
	ld	a4,-32(s0)
	srai	a5,a4,63
	srli	a5,a5,63
	add	a4,a4,a5
	andi	a4,a4,1
	sub	a5,a4,a5
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L5
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	sd	a5,-40(s0)
.L5:
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sw	a5,-20(s0)
	ld	a5,-32(s0)
	srai	a5,a5,1
	sd	a5,-32(s0)
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L4:
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,15
	ble	a4,a5,.L6
	ld	a5,-40(s0)
	sw	a5,-20(s0)
	lw	a5,-52(s0)
	sd	a5,-32(s0)
	sd	zero,-40(s0)
	sw	zero,-48(s0)
	j	.L7
.L9:
	ld	a4,-32(s0)
	srai	a5,a4,63
	srli	a5,a5,63
	add	a4,a4,a5
	andi	a4,a4,1
	sub	a5,a4,a5
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L8
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	sd	a5,-40(s0)
.L8:
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sw	a5,-20(s0)
	ld	a5,-32(s0)
	srai	a5,a5,1
	sd	a5,-32(s0)
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
.L7:
	lw	a5,-48(s0)
	sext.w	a4,a5
	li	a5,31
	ble	a4,a5,.L9
	ld	a5,-40(s0)
	sext.w	a5,a5
	mv	a0,a5
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	cube, .-cube
	.ident	"GCC: (GNU) 9.2.0"
