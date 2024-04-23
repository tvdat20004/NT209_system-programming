a = "CWWpf"
username= "059167235"
v4 = [0]*9
for i in range(9):
    if i > 1:
        if i >3: 
            v4[i] = ord(a[i-4])
        else:
            v4[i] = ord(username[i+5])
    else:
        v4[i] = ord(username[i+2])
def f():
    password = [0]*9
    for i in range(9):
        for t in range(32, 128):
            if (ord(username[i]) + v4[i]) // 2 == t:
                print(t)
                password[i] = t
    print("".join(chr(i) for i in password))
f()
