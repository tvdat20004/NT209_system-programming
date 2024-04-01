.section .data
msg: .string "Nhap nam sinh (4 ky tu): "
msg1: .string "Da tot nghiep\n"
msg2: .string "Dang hoc\n"
msg3: .string "Chua vao truong\n"
msg4: .string "Tuoi: "

.section .bss
    .lcomm num, 4
    .lcomm tuoi, 2  

.section .text
    .globl _start

_start:
    # in ra man hinh msg 
    movl $4, %eax
    movl $1, %ebx
    movl $msg, %ecx
    movl $25, %edx
    int $0x80
    
    # nhap gia tri vao bien num
    movl $3, %eax
    movl $1, %ebx
    movl $num, %ecx
    movl $5, %edx
    int $0x80

    # chuyen bien num thanh so, luu vao %edi 
    movl $num, %eax 
    movl $0, %edi
    movl $0, %esi
.loop:
    cmpl $4, %esi 
    je .done_loop
    movb (%esi, %eax), %bl
    subl $0x30, %ebx
    imul $10, %edi 
    addl %ebx, %edi
    incl %esi 
    jmp .loop 

.done_loop:
    # tinh tuoi, luu vao %esi 
    movl $2024, %esi
    subl %edi, %esi
    
    # so sanh tuoi vs 18 
    cmpl $18, %esi 
    jl .print_msg3 
    cmpl $22, %esi 
    jg .print_msg1 
    # in msg2 
    movl $4, %eax
    movl $1, %ebx
    movl $msg2, %ecx
    movl $9, %edx
    int $0x80
    jmp .print_age

.print_msg1:

    movl $4, %eax
    movl $1, %ebx
    movl $msg1, %ecx
    movl $14, %edx
    int $0x80
    jmp .print_age

.print_msg3:
    movl $4, %eax
    movl $1, %ebx
    movl $msg3, %ecx
    movl $16, %edx
    int $0x80

.print_age:
# in chuoi "Tuoi:"
    movl $4, %eax
    movl $1, %ebx
    movl $msg4, %ecx
    movl $6, %edx
    int $0x80

# in so tuoi
    movl $0, %edx
    movl %esi, %eax
    movl $10, %ecx 
    div %ecx
    addl $0x30, %eax 
    addl $0x30, %edx 
    movl $tuoi, %ebx
    cmpl $0x30, %eax
    je .print_num_age1
    movl %eax, (%ebx)
    movl %edx, 1(%ebx)
    jmp .print_num_age
.print_num_age1:
    movl %edx, (%ebx)
.print_num_age:
    movl $4, %eax
    movl $1, %ebx
    movl $tuoi, %ecx
    movl $2, %edx
    int $0x80
    # ket thuc chuong trinh
    movl $1, %eax
    int $0x80 
