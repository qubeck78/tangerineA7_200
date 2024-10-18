

#	.equ		stackPointer, 		0x00005a80 

	.equ 		stackPointer, 0x030100000
	.org 0x0

	j start

.balign 16

irq_vec:
	mret


	.globl start
	.type start,@function

start:

	li sp, stackPointer 

	#clear bss

	la t0, _sbss
	la t1, _ebss

clearbss:
	sw 	zero, (t0)
	addi	t0, t0, 4

	bltu 	t0, t1, clearbss

	#push argc and argv to stack

	addi sp,sp,-16
	sw zero,0(sp)
	sw zero,4(sp)
	sw zero,8(sp)
	sw zero,12(sp)

	# jump to main C code
	jal ra,main

1:
	j 1b

