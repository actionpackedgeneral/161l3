	.file	"program0.c"
	.text
	.globl	_matrix_vector_multiply
	.def	_matrix_vector_multiply;	.scl	2;	.type	32;	.endef
_matrix_vector_multiply:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$48, %esp
	movl	20(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	24(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	L2
L7:
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L3
L6:
	movl	$0, -24(%ebp)
	movl	$0, -20(%ebp)
	jmp	L4
L5:
	addl	$2, -24(%ebp)
	adcl	$0, -20(%ebp)
L4:
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	cmpl	-40(%ebp), %eax
	movl	%edx, %eax
	sbbl	-36(%ebp), %eax
	jl	L5
	addl	$2, -16(%ebp)
	adcl	$0, -12(%ebp)
L3:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	cmpl	-40(%ebp), %eax
	movl	%edx, %eax
	sbbl	-36(%ebp), %eax
	jl	L6
	addl	$2, -8(%ebp)
	adcl	$0, -4(%ebp)
L2:
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	cmpl	-40(%ebp), %eax
	movl	%edx, %eax
	sbbl	-36(%ebp), %eax
	jl	L7
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "passed(%f)\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$112, %esp
	call	___main
	movl	$1000, 104(%esp)
	movl	$0, 108(%esp)
	cmpl	$1, 8(%ebp)
	jle	L9
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	cltd
	movl	%eax, 104(%esp)
	movl	%edx, 108(%esp)
L9:
	movl	104(%esp), %edx
	movl	104(%esp), %eax
	imull	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, 84(%esp)
	movl	104(%esp), %edx
	movl	104(%esp), %eax
	imull	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, 80(%esp)
	movl	104(%esp), %edx
	movl	104(%esp), %eax
	imull	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	_malloc
	movl	%eax, 76(%esp)
	movl	$0, 96(%esp)
	movl	$0, 100(%esp)
	jmp	L10
L13:
	movl	$0, 88(%esp)
	movl	$0, 92(%esp)
	jmp	L11
L12:
	movl	96(%esp), %edx
	movl	104(%esp), %eax
	imull	%eax, %edx
	movl	88(%esp), %eax
	addl	%edx, %eax
	leal	0(,%eax,8), %edx
	movl	84(%esp), %eax
	leal	(%edx,%eax), %ecx
	movl	88(%esp), %eax
	movl	92(%esp), %edx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	addl	$1, 88(%esp)
	adcl	$0, 92(%esp)
L11:
	movl	88(%esp), %eax
	movl	92(%esp), %edx
	cmpl	104(%esp), %eax
	movl	%edx, %eax
	sbbl	108(%esp), %eax
	jl	L12
	addl	$1, 96(%esp)
	adcl	$0, 100(%esp)
L10:
	movl	96(%esp), %eax
	movl	100(%esp), %edx
	cmpl	104(%esp), %eax
	movl	%edx, %eax
	sbbl	108(%esp), %eax
	jl	L13
	movl	$0, 96(%esp)
	movl	$0, 100(%esp)
	jmp	L14
L15:
	movl	96(%esp), %eax
	leal	0(,%eax,8), %edx
	movl	80(%esp), %eax
	leal	(%edx,%eax), %ecx
	movl	96(%esp), %eax
	movl	100(%esp), %edx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	addl	$1, 96(%esp)
	adcl	$0, 100(%esp)
L14:
	movl	96(%esp), %eax
	movl	100(%esp), %edx
	cmpl	104(%esp), %eax
	movl	%edx, %eax
	sbbl	108(%esp), %eax
	jl	L15
	call	_clock
	movl	%eax, 72(%esp)
	movl	104(%esp), %eax
	movl	108(%esp), %edx
	movl	%eax, 12(%esp)
	movl	%edx, 16(%esp)
	movl	80(%esp), %eax
	movl	%eax, 8(%esp)
	movl	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_matrix_vector_multiply
	call	_clock
	movl	%eax, 68(%esp)
	movl	68(%esp), %eax
	subl	72(%esp), %eax
	movl	%eax, 44(%esp)
	fildl	44(%esp)
	fldl	LC0
	fdivrp	%st, %st(1)
	fstpl	56(%esp)
	fldl	56(%esp)
	fstpl	4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	84(%esp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	80(%esp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	76(%esp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_atoi;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
