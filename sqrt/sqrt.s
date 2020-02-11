#BINARY SEARCH ALGORITHM
	
	.globl sqrt
sqrt:

						#edi = x
						#esi = k iteration
						#edx = bitmask
						#ecx = result ^ 2
						#eax = result

	movl $0, %eax 		
	movl $0, %esi		#initialize iteration counter; for loop

	movl $1, %edx		#create a bitmask to apply to each iteration
	shll $15, %edx		#i.e. '1000000000000000'

loop:
	cmpl $15, %esi		#runs loop 16 times and performs bitmasking		
	jg endFunc
	incl %esi

	orl %edx, %eax		#perform bit or on bitmask and result

	movl %eax, %ecx		#creates temporary register to store result squared
	imull %eax, %ecx	

	cmpl %edi, %ecx		#if result squared greater than 'x', bitmask; otherwise go next iteration
	jle failed_cond		

	xorl %edx, %eax		#set 'k'th bit back to 0 if result squared less than 'x'

failed_cond:
	shrl $1, %edx
	jmp loop

endFunc:

	ret
