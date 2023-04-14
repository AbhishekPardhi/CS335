import os
from constants import *
from classes import *

def getSymTable():
    
    directories=os.scandir("output/")

    for directory in directories:
        if (directory.name=="3AC.txt"):
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
                    entry=func_entry(funcDesc[:-6].split(","))
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
        
