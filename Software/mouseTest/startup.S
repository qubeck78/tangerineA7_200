

	.equ		stackPointer, 		0x00005a80 
	.extern	___isrMain

	.org 0x0

	j start

.balign 16

irq_vec:

	addi	sp,	sp,	-128

	sw		x1,	0(sp)
	sw		x2,	4(sp)
	sw		x3,	8(sp)
	sw		x4,	12(sp)
	sw		x5,	16(sp)
	sw		x6,	20(sp)
	sw		x7,	24(sp)
	sw		x8,	28(sp)
	sw		x9,	32(sp)
	sw		x10,	36(sp)
	sw		x11,	40(sp)
	sw		x12,	44(sp)
	sw		x13,	48(sp)
	sw		x14,	52(sp)
	sw		x15,	56(sp)
	sw		x16,	60(sp)
	sw		x17,	64(sp)
	sw		x18,	68(sp)
	sw		x19,	72(sp)
	sw		x20,	76(sp)
	sw		x21,	80(sp)
	sw		x22,	84(sp)
	sw		x23,	88(sp)
	sw		x24,	92(sp)
	sw		x25,	96(sp)
	sw		x26,	100(sp)
	sw		x27,	104(sp)
	sw		x28,	108(sp)
	sw		x29,	112(sp)
	sw		x30,	120(sp)
	sw		x31, 	124(sp)

#	call c ISR
	jal	ra, ___isrMain
	
	lw		x31,	124(sp)
	lw		x30,	120(sp)
	lw		x29,	112(sp)
	lw		x28,	108(sp)
	lw		x27,	104(sp)
	lw		x26,	100(sp)
	lw		x25,	96(sp)
	lw		x24,	92(sp)
	lw		x23,	88(sp)
	lw		x22,	84(sp)
	lw		x21,	80(sp)
	lw		x20,	76(sp)
	lw		x19,	72(sp)
	lw		x18,	68(sp)
	lw		x17,	64(sp)
	lw		x16,	60(sp)
	lw		x15,	56(sp)
	lw		x14,	52(sp)
	lw		x13,	48(sp)
	lw		x12,	44(sp)
	lw		x11,	40(sp)
	lw		x10,	36(sp)
	lw		x9,	32(sp)
	lw		x8,	28(sp)
	lw		x7,	24(sp)
	lw		x6,	20(sp)
	lw		x5,	16(sp)
	lw		x4,	12(sp)
	lw		x3,	8(sp)
	lw		x2,	4(sp)
	lw		x1, 	0(sp)

	addi	sp,	sp,	-128

	mret


	.globl start
	.type start,@function

start:

	li sp, stackPointer 


#push argc and argv to stack

	addi sp,sp,-16
	sw zero,0(sp)
	sw zero,4(sp)
	sw zero,8(sp)
	sw zero,12(sp)

	# jump to main C code
	jal ra, main

1:
	j 1b

