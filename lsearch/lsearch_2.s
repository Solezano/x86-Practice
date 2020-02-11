	#VARIABLE MAP
	#%rdi = A[0]; base ptr
	#%rsi/%esi = int n
	#%rax/%eax = return value
	#%r8d = i
	#%r9d = tempVal
	#%rcx/%ecx = i
	#%edx = target

	
	.globl	lsearch_2
lsearch_2:
	testl	%esi, %esi						#shorter instruction version of cmpl $0, %eax; if (n <= 0) {return -1;}
	jle	endFunc					
	movslq	%esi, %rax						#move and sign-extend a value from a 32-bit source to a 64-bit destination
	leaq	-4(%rdi,%rax,4), %rax			#A[n] = A[n-1];
	movl	(%rax), %r9d					#tempVal = A[n-1];
	movl	%edx, (%rax)					#A[n-1] = target;
	cmpl	(%rdi), %edx					#target - A[i] = 0? if yes, zero 'i'
	je	targetEquals						# i = 0;
	movl	$1, %ecx

whileLoop:									#this is the while loop that performs i++ until A[i] == target
	movl	%ecx, %r8d
	addq	$1, %rcx
	cmpl	%edx, -4(%rdi,%rcx,4)			#while (A[i - 1] != target) {i++;}
	jne	whileLoop

pastWhileLoop:
	movl	%r9d, (%rax)					#A[n-1] = tempVal;
	leal	-1(%rsi), %eax
	cmpl	%r8d, %eax						# if i < (n - 1) {return i;}
	jg	elseIf
	cmpl	%edx, %r9d						#else if (A[n-i] == target) {return (n - 1);}
	jne	endFunc
	rep ret									#return (n - 1);

elseIf:
	movl	%r8d, %eax
	ret										#return 'i'

targetEquals:								#i = 0;
	xorl	%r8d, %r8d
	jmp	pastWhileLoop

endFunc:									#endcase, return -1;
	movl	$-1, %eax
	ret
