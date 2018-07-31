#!/usr/bin/python
fid = open("sc")
lastThing = 1066
lineno=-1
sizedic={"O":1,
         "k":1e3,
         "M":1e6,
         "G":1e9,
         "T":1e12,
         "P":1e15}
 
X1 = []
Y1 = []
X2 = []
Y2 = []
 
for line in fid:
    lineno+=1
    if lineno==0:
        continue
 
    x = line.split("\t")
    a = x[0]
    y = x[1].split("\xc2\xa0")
    if len(y) != 2:
        y = x[1].split(" ")
    b = y[0]
    c = y[1]
 
 
    try:
        a = float(a)
        lastThing = a
    except:
        pass
 
    b = float(b)
    d = sizedic[c.strip()[0]]
 
    print lastThing,":",b,"x",d
 
    if c.strip().endswith("FLOPS"):
        X1.append(lastThing)
        Y1.append(b*d)
    else:
        X2.append(lastThing)
        Y2.append(b*d)
 
import matplotlib.pyplot as plt
plt.semilogy(X1,Y1)
plt.semilogy(X2,Y2)
plt.legend(["FLOPS","OPS"],"upper left")
plt.xlabel("Year")
plt.ylabel("Rmax")

