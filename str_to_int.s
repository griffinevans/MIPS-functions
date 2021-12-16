#******************************************************************************
# Converts a 32-char null-terminated string of zeroes and ones into the 
# equivalent integer.
#
# Reading from the most significant bit, convert each byte into its binary 
# value and store it in the LSB of the destination register, then 
# shift destination left & increment until end of string.

# Variable key:
# $t0: address of byte to be read
# $v1: destination register
# $t1: counter
# $t2: value of current char (byte)
	la $t0, inputBuffer		# t0 = base address of string
	li $v1, 0			
	li $t1, 0			
convert_loop:
	lbu $t2, 0($t0)			# t2 = current char
	addi $t2, $t2, -48		# convert from char to int 0000 or 0001
	or $v1, $v1, $t2		# set current bit to char val
	sll $v1, $v1, 1			# fetch next bit of dest 
	addi $t0 $t0, 1			# fetch next byte of source
	addi $t1, $t1, 1		# counter++
	blt $t1, 31, convert_loop	# for bytes 0-31
end_convert:
	lbu $t2, 0($t0)			# Set last bit
	addi $t2, $t2, -48		
	or $v1, $v1, $t2		

	jr $ra
