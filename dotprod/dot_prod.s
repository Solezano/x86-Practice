	.globl dot_prod
dot_prod:

						#%rdi = matrix A
						#%rsi = matrix B
						#%edx = N
						#%ecx = i
						#%r8 = j
						#%r9 = 'i'th iterative value
						#%r10 = A[i, j] * B[j, i]
						#%rax = dot product

	pushq %rdi			#preserve caller saved values when executing subroutine
	pushq %rsi
	pushq %rdx
	pushq %rcx
	pushq %r8

	imulq %rdx, %rcx
	leaq (%rcx, %rdi), %rdi		#create the matrix index starting points to perform dot product	

	leaq (%r8, %rsi), %rsi		

	movq $0, %r9
	movq $0, %rax

start:

	cmp %rdx, %r9
	jge checkIf
	incq %r9
	movq (%rsi), %r10
	imulq (%rdi), %r10			#perform dot product by multiplying matrix indexes together and iterate
	addq %r10, %rax				
	addq $1, %rdi
	addq %rdx, %rsi
	jmp start

GreaterThan127:					#if the end result falls out of range, move zero into %edx register
	movl $0, %edx
	jmp endFunc

LessThan128:
	movl $0, %edx
	jmp endFunc

checkIf:						#check for overflow if falls out of range
	cmp $128, %rax
	jge GreaterThan127

	cmp $-129, %rax
	jle LessThan128			

endFunc:

	popq %r8					#return the original caller saved values into mainline routine
	popq %rcx
	popq %rdx
	popq %rsi
	popq %rdi

	ret


