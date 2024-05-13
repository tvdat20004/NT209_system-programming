string = "xyz{} "
arr = bytes.fromhex("020000000A00000006000000010000000C00000010000000090000000300000004000000070000000E000000050000000B000000080000000F0000000D000000")

arr = [int.from_bytes(arr[i:i+4], "little") for i in range(0,len(arr), 4)]
sum = 0
for i in string:
	print(ord(i) % 16)
	sum += arr[ord(i) & 15]
print(sum)