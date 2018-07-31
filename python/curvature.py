#!/usr/bin/python


#curvature calculation

p=3 # p is power for norm calculation in (EiEj(Xij)^p))^(1/p)
#here p=4 gives orientation free same result for any set of normals having relatively same position in space. (found by hit & trial though not proved.)
listP = [1.0,2.0,3.0,4.0,5.0]

#vectors=[[1,0,0],[0,1,0],[0,0,1]]
#vectors=[[1,1,0],[0,1,1],[1,0,1]]
#vectors=[[1,0,0],[0,1,0],[1,0,0]]
#vectors=[[1,-1,1],[1,1,-1],[-1,1,1],[-1,-1,-1]]
#vectors=[[1,0,0],[-.5,.866,0],[-.5,-.866,0]]
vectors=[[1,1,0],[-1,-1,0],[-1,1,0],[1,-1,0]]
#list1 = [.5, .5, 0, .5, .5, 0, 0, 0, 0]


def norm(mat):
	for i in range(3):
		print "[", str(mat[i*3]).ljust(7)[:7], str(mat[i*3+1]).ljust(7)[:7], str(mat[i*3+2]).ljust(7)[:7], "]"
	for p in listP:
		sum = 0.0
		for val in mat:
			sum += val**p
		sum = sum**(1/p)
		print "A"+str(int(p))+"=", sum
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
			CVmat+=[(abs((covar/len(listVector)))**.5)]
	return CVmat

def normalise(vector):
	mag=0.0
	for i in vector:
		mag+=(i**2)
	mag=mag**.5
	for i in range(3):
		vector[i]/=mag
	return vector				

def normaliseList(listVector):
	normList=[]
	for vector in listVector:
		normList+=[normalise(vector)]
	return normList


#listNormal = [[1,0,0],[-1,0,0],[0,1,0],[0,-1,0]]
listNormal = normaliseList(vectors)
covarMatrix = covarience(listNormal)
norm(covarMatrix)
