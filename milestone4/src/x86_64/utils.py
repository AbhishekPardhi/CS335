import numpy as np

# Field declarations
field_decl = {}

def BuildNextUseTable(lines):
    vars = {} # Dictionary of vars with var -> [live, next_use]
    tuples = []

    for i,line in enumerate(lines):
        tokens = line.strip().split()
        if len(tokens)>=3 and tokens[2]=="=" and tokens[1] not in vars:
            vars[tokens[1]]=[False,None]
    
    for i in range(len(lines)-1,-1,-1):
        line = lines[i]
        tokens = line.strip().split()
        if len(tokens)>=3 and tokens[2]=="=":
            if len(tokens)==6:
                tuple = vars.copy()
                vars[tokens[1]] = [False,None]
                vars[tokens[3]] = vars[tokens[5]] = [True,i]
                tuples.append(tuple)
            elif len(tokens)==4:
                tuple = vars.copy()
                vars[tokens[1]] = [False,None]
                tuples.append(tuple)
            else:
                tuple = vars.copy()
                tuples.append(tuple)
    
    tuples = np.array(tuples)
    return tuples[::-1]

# Return arr, index
def BreakArray(string):
    breakdown = string.replace('[',' ').replace(']',' ').split()
    return breakdown[0], breakdown[1]

# Fetch field declarations table
def FetchFieldDecl(path, class_name):
    global field_decl
    with open(f'{path}output/Class-{class_name}/FieldDeclarations.csv','r') as f:
        lines = f.readlines()
    for i,line in enumerate(lines):
        if(i==0):
            continue
        tokens = line.strip().split(',')
        sep_tokens = tokens[0].split('-')
        field_decl[sep_tokens[1]] = int(tokens[2])

# Use actual symbol table
def SymTable(obj, var):
    global field_decl
    if var in field_decl:
        return field_decl[var]
    else:
        print('Variable not found in field declarations table')
        return 0