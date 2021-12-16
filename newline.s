#******************************************************************************
# Print a newline character. Saves me time when writing tests
fn_newline:
	la $a0, str_newline
	li $v0, 4			# print newline
	syscall
	jr $ra

