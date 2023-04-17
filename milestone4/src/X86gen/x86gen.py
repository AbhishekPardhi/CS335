import os,sys
from constants import *
from utils import *
from classes import *

def main():
    global currFunc
    getSymTable()
    print(FMap)
    l=makeBB()

    for i in range(len(l)-1):
        for j in range(l[i+1]-l[i]):
            code=threeAC[l[i]+j-1]
            code=code.split("\t")[1]

            # fucntion name
            if code.rstrip()[-1]==":":
                currFunc=code[:-1]
                out.append(code)
           
            # of the form a = b op c
            # print(code,len(code.split(" ")))
            code =split(code)
            if len(code)==5:
                if len(code[3])==1:
                    out.append(str(l[i]+j+1)+" " +opMap[code[3]]+" "+getReg(code[2],currFunc)+","+getReg(code[4],currFunc))
    
    with open("output/x86.txt","w") as f:
        for line in out:
            f.write(line+"\n")
    
    # print the address descriptor
    print(RegDesc)


if __name__ == "__main__":
    main()