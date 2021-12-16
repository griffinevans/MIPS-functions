#******************************************************************************
# returns an index 0-31 or -1 if given int matches array
# unused because I thought it was easier to store the index when iterating
# 
# Register usage
# $a0: input
# $v0: index 
# $t0: pattern
fn_pattern:
	li $v0, 0			# count = 0
	la $t0, array			# temp = &array
pattern_loop:
	add $t0, $t0, $v0		# temp = array[i]
	xor $t0, $t0, $a0		# get difference between temp and input
	beq $t0, $0, pattern_match	# if no difference, match found
	addi $v0, $v0, 1		# count++ 

	blt $v0, 33, pattern_loop	# repeat for all patterns
	li $v0, -1			# if no match found, return -1 
	jr $ra 	
pattern_match: 
	jr $ra	

