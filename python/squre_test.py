#!/usr/bin/python
for i in range(5):
	x = int(raw_input("give a number: "))
	ans = 0
	if x>=0:
		while ans*ans<x:
			ans=ans+1
		if ans*ans==x:
			print ans
		else: print x," is not perfect squre"
	else: print x, " is negative"

#>Tuple:ordered sequence of elements. (immutable)
#>eg foo=(1,2,3,4,5)  #here [] means list not tuple

