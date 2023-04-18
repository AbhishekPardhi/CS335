import os
from constants import *
from classes import *

def getSymTable():    
    directories=os.scandir("output/")

    for directory in directories:
        if (directory.name in ["x86.s","reg.csv","addr.csv"]):
            continue
        if (directory.name=="3AC.txt"):
            with open("output/"+"3AC.txt","r") as f:
                threeAC.extend(f.readlines())
                clean3AC()
                markFunctions()
            continue
        
        files=os.scandir("output/"+directory.name)
        className=directory.name

        # maps function name to list of function entries
        funcMap={}
        for file in files:
            funcName=file.name[:-4]
            
            # has all entries of the function
            func_entries=[]
            
            with open("output/"+directory.name+"/"+file.name,"r") as f:
                # header
                f.readline()
                if file.name[:-4]=="FieldDeclarations":
                    for line in f.readlines():
                        entry=func_entry(line[:-1].split(","))
                        func_entries.append(entry)
                else:
                    # function description
                    funcDesc=f.readline()
                    entry=func_entry(funcDesc[:-7].split(","))
                    func_entries.append(entry)

                    for line in f.readlines():
                        entry=func_entry(line[5:-1].split(","))
                        func_entries.append(entry)
            funcMap[funcName]=func_entries
        symTable[className]=funcMap

def printSymTable():
    for className in symTable.keys():
        print(className)
        print()
        for funcName in symTable[className].keys():
            print(funcName)
            for entry in symTable[className][funcName]:
                print(entry.name,entry.type,entry.lineno,entry.offset,entry.numParam,entry.is_static,entry.is_final,sep=",")
            print()

def clean3AC():
    for i in range(len(threeAC)):
        threeAC[i]=threeAC[i].rstrip()

def markFunctions():
    for line in threeAC:
        if line[-1]==":":
            split=line[:-1].split("\t")
            FMap[split[1]]=int(split[0])

def lookup(name,id,currFunc):
    for i in symTable["Class-"+currFunc.split("-")[0]][currFunc]:
        if i.name==name and i.id==id :
            return i
    return None

def checkVar(name,currFunc):
    split=name.split("{")
    if len(split)==1:
        return None , False
    varname=split[0]
    id=int(split[1][:-1])
    if lookup(varname,id,currFunc) is not None:
        return lookup(varname,id,currFunc).offset , True
    return None , False

def makeBB():
    BB=[]
    for i in FMap.values():
        BB.append(i)
    for line in threeAC:
        # check if the line has " goto " as a substring
        if "goto " in line:
            BB.append(int(line.split("\t")[0]))
            BB.append(BB[-1]+1)
        if "call " in line:
            BB.append(int(line.split("\t")[0]))
            BB.append(BB[-1]+1)
    BB= set(BB)
    BB= list(BB)
    BB.sort()
    return BB

def split(s):
    s.rstrip()
    ans=[]
    temp=""
    flag=0
    for i in s:
        if i=="\"" and flag==0:
            flag=1
            temp+=i
        elif i=="\"" and flag==1:
            flag=0
            temp+=i
            ans.append(temp)
            temp=""
        elif i==" " and temp!="" and flag==0:
            ans.append(temp)
            temp=""
        elif i==" " and temp=="" and flag==0:
            continue
        else:
            temp+=i
    ans.append(temp)
    return ans
        
def addAddrDesc(name,location):
    if name not in AddrDesc.keys():
        AddrDesc[name]=[]
    if location not in AddrDesc[name]:
        AddrDesc[name].append(location)

def addRegDesc(reg,name):
    if reg not in RegDesc.keys():
        RegDesc[reg]=[]
    if name not in RegDesc[reg]:
        RegDesc[reg].append(name)

def searchAddrDesc(name):
    if name in AddrDesc.keys():
        return AddrDesc[name]
    return None

def removeAddrFromRegDesc(reg,name):
    if reg in RegDesc.keys():
        if name in RegDesc[reg]:
            RegDesc[reg].remove(name)

def removeAddrFromAddrDesc(addr,name):
    if name in AddrDesc.keys():
        if addr in AddrDesc[name]:
            AddrDesc[name].remove(addr)

def removeRegFromAddrDesc(reg):
    todel=[]
    for i in AddrDesc.keys():
        if reg in AddrDesc[i]:
            AddrDesc[i].remove(reg)
        if AddrDesc[i] ==[]:
            todel.append(i)
    for i in todel:
        del AddrDesc[i]

def removeTemp(name,currFunc):
    offset,isVar = checkVar(name,currFunc)
    if isVar==False:
        if name in AddrDesc.keys():
            for reg in AddrDesc[name]:
                RegDesc[reg].remove(name)
            del AddrDesc[name]

def getReg(name,currFunc):
    # case when the variable is already in the register
    if name in AddrDesc.keys():
        # check if name is a variable
        offset,isVar = checkVar(name,currFunc)
        if AddrDesc[name][-1][-1]!="]" and isVar:
            return AddrDesc[name][-1]
    
    # case when the variable is not in the register
    for reg in RegDesc.keys():
        if RegDesc[reg]==[]:
            offset,isVar = checkVar(name,currFunc)
            if isVar:
                out.append("\t"+"mov "+" %rsp[-"+str(offset)+"] "+reg)
                addRegDesc(reg,name)
                addAddrDesc(name,"%rsp[-"+str(offset)+"]")
                addAddrDesc(name,reg)
            else:
                if name[0] == "t":
                    addAddrDesc(name,reg)
                    addRegDesc(reg,name)
                else:
                    out.append("\t"+"mov "+name+","+reg)
                    addAddrDesc(name,reg)
                    addRegDesc(reg,name)
            return reg
    
    # case when all the registers are full
    print("All registers are full, trying to spill one")
    for id in AddrDesc.keys():
        # find a variable which is also stored in a reg
        if AddrDesc[id][0][-1]!="]" and len(AddrDesc[id])!=1:
            reg=AddrDesc[id][1]
            # remove reg from all other AddrDesc and RegDesc
            removeRegFromAddrDesc(reg,)
            RegDesc[reg].remove(id)
            # add the new variable to the reg
            AddrDesc[name]=[]
            AddrDesc[name].append(reg)
            RegDesc[reg].append(name)
            print("Spilled "+id+" to "+reg)
            return reg
    print("All registers are full, no variable to spill")
    return "NONE"
    
    
    