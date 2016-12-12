# Bond Energy Algorithm implementation in pure Python
# Big Data and Business Intelligence
#
# authors
#		Oliver Erxleben <oliver.erxleben@hs-osnabrueck.de>
#		Jens Overmöller <jens.overmoeller@hs-osnabrueck.de>
#

import numpy

# global vars
n = 4
Matrix = [[0 for x in range(n)] for y in range(n)] # simple matrix like store
aum = Matrix # attribute-usage-matrix
aam = Matrix # attribute affinity matrix
cam = Matrix # clustered affinity matrix

index = 0
array = []
maxIndex = []
maxIndex2 = []

#
def cont(ai, ak, aj, m):
    if ak == aj:
        return 2 * bond(ai, ak, m) + 2 * bond(ak, aj, m)
    else:
        return 2 * bond(ai, ak, m) + 2 * bond(ak, aj, m) - 2 * bond(ai, aj, m)

#Calculate bond energy for 2 columns
def bond(ax, ay, CA):
    result = 0
    if ax<0 or ay<0:
        return 0
    if ax == index:
        for i in range(0,n):
            result += array[i] * CA[i][ay]
        return result
    if ay == index:
        for i in range(0,n):
            result += array[i] * CA[i][ax]
        return result
    for i in range(0,n):
        result += CA[i][ax] * CA[i][ay]
    return result

def maxCont(res):
    maxValue = 0
    for i in range(len(res)):
        if res[i][3]>maxValue:
            maxValue = res[i][3]
            maxindex = res[i][2]
    return maxindex

# bea as a function
def bea(AA):
  global n
  CA = Matrix
  #Add two columns to new matrix
  for i in range(0,n):
    global cam
    CA[i][0] = AA[i][0]
    CA[i][1] = AA[i][1]

    global index
    index = 2

    #temporarilly store results
    s = [0,0,0,0]

    # calculate bond energy
    while (index<=n-1):
    	results = []
    	global array
    	array = AA[:][index]

    	for i in range(0, n):
    	  result = cont(i-1,index,i, CA)
    	  s[0]=i-1
    	  s[1]=index
    	  s[2]=i
    	  s[3]=result
    	  v=[]
    	  v=s[:]
    	  results.append(v)
    	  i+=1
    	CA = numpy.insert(CA, maxCont(results), numpy.array((array)), 1)
    	maxIndex.append(maxCont(results))
    	maxIndex2.append(index)
    	CA = numpy.delete(CA, (-1), 1)
    	CA[:][[0, 1]] = CA[:][[1, 0]]
    	index+=1

    	#reordering
    	for i in range(len(maxIndex)):
    	  CA[[maxIndex[i], maxIndex2[i]]][:] = CA[[maxIndex2[i], maxIndex[i]]][:]

    	return CA

# define values for usage matrix
aum[0][0] = 1
aum[0][1] = 0
aum[0][2] = 0
aum[0][3] = 1

aum[1][0] = 0
aum[1][1] = 1
aum[1][2] = 0
aum[1][3] = 1

aum[2][0] = 1
aum[2][1] = 0
aum[2][2] = 1
aum[2][3] = 0

aum[3][0] = 1
aum[3][1] = 0
aum[3][2] = 1
aum[3][3] = 1

print(aum)

# define values for affinity matrix
aam[0][0] = 110 # -
aam[0][1] = 0
aam[0][2] = 80
aam[0][3] = 70

aam[1][0] = 0
aam[1][1] = 25 # -
aam[1][2] = 0
aam[1][3] = 25

aam[2][0] = 80
aam[2][1] = 0
aam[2][2] = 80 # -
aam[2][3] = 40

aam[3][0] = 70
aam[3][1] = 25
aam[3][2] = 40
aam[3][3] = 95 # -

print(aam)

# calculate bond energy for affinity matrix
cam = bea(aam)

# print results

print (cam)
