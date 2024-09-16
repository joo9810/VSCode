a = input()
croatia = ['c=','c-','dz=','d-','lj','nj','s=','z=']
unique_list = []
while True:
    changed = False
    for i in croatia:
        if i in a:
            unique_list.append(i)
            a = a.replace(i,' ',1)
            changed = True
    if changed == False:
        break
print(len(unique_list)+len(a.replace(' ','')))