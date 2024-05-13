enc = "Zsnajwxnyd Tk Nsktwrfynts Yjhmstqtld"
enc_num = [ord(i) for i in enc]
# print(enc_num)
original = ""
for i in range(len(enc)):
    for c in range(32, 127):
        v3 = c
        if ((c <= 96 or c > 122) and (c <= 64 or c > 90)):
            if ( c > 47 and c <= 57 ):
                c = (c - 48 + 5) % 10 + 48
        else:
            if(c<=96):
                tmp = 65
            else:
                tmp = 97
            c = (c - tmp + 5) % 26 + tmp

        if(c == enc_num[i]):
            original += chr(v3)
            break

print(original)
