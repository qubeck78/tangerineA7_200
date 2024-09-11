
	.equ		stackPointer, 		0x00006d40 

	.org 0x0

	j start

.balign 16

irq_vec:
#	picorv32_retirq_insn()


	.globl start
	.type start,@function

start:

#init stack pointer 

	li sp, stackPointer

	li a5, stackPointer
	li t0, 0x1f41

	sh t0, 0(a5)
	sh t0, 2(a5)
	sh t0, 4(a5)
	sh t0, 6(a5)
	
#loop: j loop

# initialize control and status registers
#	csrw mepc,        zero
#	csrw mcause,      zero
#	csrw mscratch,    zero
#	csrw mtval,       zero

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

