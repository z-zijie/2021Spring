import sys
from itertools import combinations
import gurobipy as gp
from gurobipy import GRB

# Parse argument

if len(sys.argv) < 2:
    print('Usage: atsp.py instance')
    sys.exit(1)

# Read the data

f = open(sys.argv[1])

nnodestr = f.readline().split()
n = int(nnodestr[0])

dist = {}
strcosts = f.read().split()
for i in range(n):
	for j in range(n):
		dist[i,j] = int(strcosts[i*n+j])

m = gp.Model()

# Create variables

x = m.addVars(n, n, vtype=GRB.BINARY, name='x')
u = m.addVars(n, lb=2, ub=n, vtype=GRB.INTEGER, name='u')

m.setObjective(gp.quicksum(dist[i,j]*x[i,j] for i in range(n) for j in range(n)), GRB.MINIMIZE)

# Initial constraint
for i in range(n):
    m.addConstr(gp.quicksum(x[i,j] for j in range(n) if j!=i)==1)
for j in range(n):
    m.addConstr(gp.quicksum(x[i,j] for i in range(n) if i!=j)==1)

# Position constraint
for i in range(1, n):
    for j in range(1, n):
        m.addConstr(u[i]-u[j]+1<=(n-1)*(1-x[i,j]))
m.Params.timelimit=180.0
# m.Params.varbranch=2
# m.Params.varbranch=3
# m.Params.cuts=0

m.optimize()
