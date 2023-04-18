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
            code =split(code)
            print("".join(code))
            input("")


            if len(code)==5:
                if len(code[3])==1:
                    out.append("\t;"+code[0]+" = "+code[4]+" "+code[3]+" "+code[2])
                    out.append("\t"+opMap[code[3]]+" "+getReg(code[4],currFunc)+","+getReg(code[2],currFunc))
                    # assign the last reg as reg for a
                    reg=getReg(code[2],currFunc)
                    removeRegFromAddrDesc(reg)
                    removeAddrFromRegDesc(reg,code[2])
                    addRegDesc(reg,code[0])
                    addAddrDesc(code[0],reg)
                    removeTemp(code[4],currFunc)
            
            # form a = b
            if len(code)==3 and code[1]=="=" and code[2]!="PopParam":
                out.append("\t;"+code[0]+" = "+code[2])
                out.append("\tmov "+getReg(code[2],currFunc)+","+getReg(code[0],currFunc))
                # remove entry of b from addrDesc of b
                removeTemp(code[2],currFunc)
            
            # form a = cast_to b
            if len(code)==4 and "cast_to_" in code[2]:
                out.append("\t;"+code[0]+" = "+code[2]+" "+code[3])
                out.append("\tmov "+getReg(code[3],currFunc)+","+getReg(code[0],currFunc))
                removeTemp(code[3],currFunc)

            # form a = op b
            if len(code)==4 and code[1]=="=" and code[2] in unaryOpMap.keys():
                out.append("\t;"+code[0]+" = "+code[2]+" "+code[3])
                out.append("\t"+unaryOpMap[code[2]]+" "+getReg(code[3],currFunc)+","+getReg(code[0],currFunc))
                removeTemp(code[3],currFunc)

            # form a = call funcName
            if len(code)==4 and code[1]=="=" and code[2]=="call":
                out.append("\t;"+code[0]+" = "+code[2]+" "+code[3])
                out.append("\tcall "+code[3])
                out.append("\tmov %rax,"+getReg(code[0],currFunc))
                removeTemp(code[3],currFunc)
            
            # form Return a
            if len(code)==2 and code[0]=="Return":
                out.append("\t;"+code[0]+" "+code[1])
                out.append("\tmov "+getReg(code[1],currFunc)+",%rax")
                removeTemp(code[1],currFunc)
                out.append("\tret")
            
            with open("output/reg.csv","w") as f:
                for k in RegDesc.keys():
                    f.write(k+"".join([","+i for i in RegDesc[k]])+"\n")
            with open("output/addr.csv","w") as f:
                for k in AddrDesc.keys():
                    f.write(k+"".join([","+i for i in AddrDesc[k]])+"\n")
 
    with open("output/x86.s","w") as f:
        for line in out:
            f.write(line+"\n")
    
    # print the address descriptor
    print(RegDesc)
    print(AddrDesc)


if __name__ == "__main__":
    main()