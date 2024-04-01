.section .data
msg1: .string "Nhap SBD (6 ky tu): "
msg2: .string "Nien Khoa: "
msg3: .string "Sinh vien nam: "
.section .bss
    .lcomm num, 12
    .lcomm res, 12
    .lcomm res2, 12
    .lcomm res3, 8

.section .text
    .globl _start

_start:
    # viet ra man hinh nhap sbd
    movl $4, %eax
    movl $1, %ebx
    movl $msg1, %ecx
    movl $20, %edx
    int $0x80

    # doi nguoi dung nhap vao
    movl $3, %eax
    movl $1, %ebx
    movl $num, %ecx
    movl $6, %edx
    int $0x80

    # concatenate msg2 to the input
    movl $0, %esi
    movl $0, %edi
.loop:
    movb (%ecx,%edi), %al
    cmp $2, %esi
    je .plus1
    cmp $3, %esi
    je .plus2
    cmp $8, %esi
    je .done
    movb %al, res(%esi)
    inc %esi
    inc %edi
    jmp .loop
.plus1:
    movb $0x35, %al
    movb %al, res(%esi)
    inc %esi
    jmp .loop
.plus2:
    movb $0x32, %al
    movb %al, res(%esi)
    inc %esi
    jmp .loop
.done:
    movw $0x202c, res(%esi)

# Nien khoa

    xor %esi, %esi
    movw $0x3032, res2(%esi)
    add  $2, %esi
    movw (%ecx), %dx
    movw %dx, res2(%esi)
    add  $2, %esi
    movw $0x202c, res2(%esi)

# sinh vien nam
    xor %esi, %esi
    xor %eax, %eax
    xor %edx, %edx
.loop2:
    movb (%ecx,%edx), %al
    sub $0x30, %eax
    add %eax, %esi
    cmp $1, %edx
    je .write
    imul $10, %esi
    inc %edx
    cmp $2, %edx
    jne .loop2
    

.write:
    mov $0x18, %eax
    sub %esi, %eax
    add $0x30, %eax
    mov %eax, res3
    mov $1, %eax
    movb $0xa, res3(%eax)

    # in ra mssv
    movl $4, %eax
    movl $1, %ebx
    movl $res, %ecx
    movl $12, %edx
    int $0x80

    # in ra msg2
    movl $4, %eax
    movl $1, %ebx
    movl $msg2, %ecx
    movl $11, %edx
    int $0x80

    # in ra nien khoa
    movl $4, %eax
    movl $1, %ebx
    movl $res2, %ecx
    movl $8, %edx
    int $0x80


    #in ra msg3
    movl $4, %eax
    movl $1, %ebx
    movl $msg3, %ecx
    movl $15, %edx
    int $0x80

    #in ra so nam
    movl $4, %eax
    movl $1, %ebx
    movl $res3, %ecx
    movl $8, %edx
    int $0x80

    movl $1, %eax
    int $0x80
