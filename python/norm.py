#!/usr/bin/python

#x = int(raw_input("give a number: "))
#ans = 0
#if x>=0:
#	while ans*ans<x:
#		ans=ans+1
#	if ans*ans==x:
#		print ans
#	else: print x," is not perfect squre"
#else: print x, " is negative"

#>Tuple:ordered sequence of elements. (immutable)
#>eg foo=(1,2,3,4,5)  #here [] means list not tuple


#curvature calculation

p=3 # p is power for norm calculation in (EiEj(Xij)^p))^(1/p)
listP = [1,2,3]

list1 = [.5, .5, 0, .5, .5, 0, 0, 0, 0]


def norm(mat):
	for i in range(3):
		print "[", float(mat[i*3]), float(mat[i*3+1]), float(mat[i*3+2]), "]"
	for p in listP:
		sum = 0.0
		for val in mat:
			sum += val**p
		sum = sum**(1/p)
		print "A"+str(p)+"=", sum
	print "Amax=", max(mat)
		
def covarience(listVector):
	CVmat=[]
	avgVector=[0.0, 0.0, 0.0]

	for j in range(3):
		for vector in listVector:
			avgVector[j]+=vector[j]
		avgVector[j]/=len(listVector)

	for i in range(3):
		for j in range(3):
			covar=0.0
			for vector in listVector:
				covar+=((vector[i]-avgVector[i])*(vector[j]-avgVector[j]))
			CVmat+=[((covar/len(listVector))**.5)]
	return CVmat

				


listVector1 = [[1,0,0],[-1,0,0],[0,1,0],[0,-1,0]]
covarMatrix = covarience(listVector1)
norm(covarMatrix)
