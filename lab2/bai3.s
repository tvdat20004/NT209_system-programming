.section .data
msg1: .string "Enter a number (2-digit): "
msg2: .string "Count 4x: "

.section .bss
    .lcomm num, 4
    .lcomm arrip, 8
    .lcomm res, 4

.section .text
    .globl _start

_start:
    xor %esi, %esi
.loop:
    # viet ra man hinh enter number
    movl $4, %eax
    movl $1, %ebx
    movl $msg1, %ecx
    movl $26, %edx
    int $0x80

    # doi nguoi dung nhap vao
    movl $3, %eax
    movl $1, %ebx
    movl $num, %ecx
    movl $3, %edx
    int $0x80

    # convert number
    xor %edi, %edi
    xor %eax, %eax
    xor %edx, %edx
.loop2:
    movb (%ecx, %edi), %al
    sub $0x30, %eax
    add %eax, %edx
    cmp $1, %edi
    je .DoneConvert
    inc %edi
    imul $10, %edx
    jmp .loop2

.DoneConvert:
    mov %edx, arrip(%esi)
    inc %esi
    cmp $4, %esi
    jle .loop

    mov $0, %edx
    movl $4, %ecx
    mov $0, %edi
    xor %esi, %esi
    xor %eax, %eax

.count:
    mov arrip(%esi), %eax
    div %ecx
    cmp $0, %edx
    je .ok
    inc %esi
    jmp .DoneCount

.ok:
    inc %edi
    inc %esi
    jmp .DoneCount

.DoneCount:
    cmp $5, %esi
    jne .count

    mov $0, %esi
    add $0x30, %edi
    mov %edi, res(%esi)
    inc %esi
    movb $0xa, res(%esi)

    movl $4, %eax
    movl $1, %ebx
    movl $msg2, %ecx
    movl $10, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    movl $res, %ecx
    movl $3, %edx
    int $0x80

    movl $1, %eax
    int $0x80
