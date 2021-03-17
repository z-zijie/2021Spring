import sys
import gurobipy as gp
from gurobipy import GRB

# Parse argument

#if len(sys.argv) < 2:
#    print('Usage: tsp.py file')
#    exit(1)

# Read the data

#f = open(sys.argv[1])
f = open('ftv47.atsp')

nnodestr = f.readline().split()
n= int(nnodestr[0])

distance = {}
strcosts = f.read().split()
for i in range(n):
	for j in range(n):
		distance[i,j] = int(strcosts[i*n+j]);
print(distance[1,2])

f.close()
