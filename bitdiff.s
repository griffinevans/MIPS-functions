#******************************************************************************
# Returns the number of bits that are different between $a0 and $a1. 
# Basically popcount($a0 xor $a1)
# 
# Register usage
# $a0, $a1: registers to be diffed
# $t0: x, register holding the bits of difference
# $t1: temp
# $v0: count (# of bits that are different) 
fn_bitdiff:
	li $v0, 0			# count = 0
	xor $t0, $a0, $a1	
popcount_loop:	
	andi $t1, $t0, 1		# temp = x & 1
	add $v0, $t1, $v0		# count += temp
	srl $t0, $t0, 1			# x >>= 1

	bne $t0, $0, popcount_loop	# loop while x != 0  
	jr $ra 

