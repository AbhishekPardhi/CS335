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

def giveEntry(name,currFunc):
    split=name.split("{")
    if len(split)==1:
        return None , False
    varname=split[0]
    id=int(split[1][:-1])
    if lookup(varname,id,currFunc) is not None:
        return lookup(varname,id,currFunc) , True
    return None , False

def parameterList(name):
    classname="Class-"+name.split("-")[0]
    funcname=name
    entry=symTable[classname][funcname]
    l=[]
    for i in range(entry[0].numParam) :
        l.append(entry[i+1].type)
    return l

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
    for key in FMap.keys():
        BBMap[key]=FMap[key]
        BB.append(FMap[key])
    for line in threeAC:
        # check if the line has " goto " as a substring
        if "goto " in line:
            BB.append(int(line.split("\t")[0]))
            BB.append(BB[-1]+1)
            BB.append(int(line.split(" ")[-1]))
        if "call " in line:
            BB.append(int(line.split("\t")[0]))
            BB.append(BB[-1]+1)
    BB.append(len(threeAC))
    BB= set(BB)
    BB= list(BB)
    BB.sort()
    for i in range(len(BB)):
        BBMap["BB_"+str(i)]=BB[i]
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
