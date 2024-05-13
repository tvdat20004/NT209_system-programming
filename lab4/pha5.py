arr = [2, 10, 6, 1, 12, 16, 9, 3, 4, 7, 14, 5, 11, 8, 15, 13]
import itertools

com = list(itertools.combinations(arr, 6)) # các tổ hợp chập 6 của arr
count = 0
for i in range(2,8): # để 16*i phải nằm trong khoảng 32-126
    for c in com:
        if sum(c) == 51:
            if all([32 <= 16*i + arr.index(k) < 127 for k in c]):
                print("".join(chr(16*i + arr.index(k)) for k in c)) 
                count += 1              
    i += 1
print(f"There are {count} strings that satisfy the condition.")
