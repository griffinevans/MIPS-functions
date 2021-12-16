#******************************************************************************
# Euclid's greatest common divisor algorithm:
# GCD(M,N) = (N > 0)? GCD(N, M % N) : M
# VARIABLE KEY
# a0 = M
# a1 = N
fn_gcd: 
	beq $a1, $0, returnM	# if N = 0 return M

	# GCD (N, M % N)
	rem $t0, $a0, $a1	# t0 = M % N
	move $a0, $a1		# M = N
	move $a1, $t0		# N = M % N
	addi $sp, $sp, -4	# space for $ra in stack
	sw $ra, 0($sp)		# push $ra to stack 
	
	jal fn_gcd		# recursive function call 
	
	lw $ra, 0($sp)		# pop $ra from stack
	addi $sp, $sp, 4	# pop stack frame
	jr $ra
returnM: 
	move $v0, $a0		# return M
	jr $ra

