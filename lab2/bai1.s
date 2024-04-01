.section .data
msg: .string "nhom7NTN"
a = . - msg

.section .bss
    .lcomm len, 1

.section .text 
	.globl _start 

_start:
	# chuyen gia tri a sang gia tri cua ki tu tuong ung, luu vao %esi
	movl $a, %esi
	addl $0x30, %esi
	subl $1, %esi
	# gan %esi vao len
	movl $len, %eax 
	movl %esi, (%eax)
	# in ra len
	movl $1, %edx
	movl $len, %ecx
	movl $1, %ebx
	movl $4, %eax
	int $0x80
	# ket thuc chuong trinh
	movl $1, %eax
	int $0x80
