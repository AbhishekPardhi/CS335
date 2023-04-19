import os,sys
from constants import *
from utils import *
from classes import *
from regalloc import *

def main():
    global currFunc
    getSymTable()
    # print(FMap)
    l=makeBB()

    operator = ""
    out.append("\t.globl main")
    out.append("")

    out.append(".LCO:")
    out.append("\t.string \"%lld\\n\"")

    params=[]
    for i in range(len(l)-1):
        for j in range(l[i+1]-l[i]):
            code=threeAC[l[i]+j-1]
            linenum=code.split("\t")[0]
            code=code.split("\t")[1]

            # fucntion name
            if code.rstrip()[-1]==":":
                currFunc=code[:-1]
           
            code =split(code)
            # print("".join(code),end="\n")
            # input("")
            if int(linenum) in BBMap.values():
                for key in BBMap.keys():
                    if BBMap[key]==int(linenum):
                        funcName="_".join(key.split("-"))
                        out.append("")
                        if funcName.split("_")[-1]=="main":
                            out.append("main:")
                            break
                        out.append(funcName+":")
                        break
        
            if len(code)==2 and code[0]=="goto":
                out.append("\t# "+code[0]+" "+code[1])
                for key in BBMap.keys():
                    if BBMap[key]==int(code[1]):
                        out.append("\tjmp "+key)
                        break

            # of the form a = b op c
            if len(code)==5 and code[1]=="=":
                if len(code[3])==1:
                    out.append("\t# "+code[0]+" = "+code[4]+" "+code[3]+" "+code[2])
                    # check if a is a variable
                    offset,flag=checkVar(code[0],currFunc)
                    out.append("\t"+opMap[code[3]]+" "+getReg(code[4],currFunc)+","+getReg(code[2],currFunc))
                    if flag:
                        out.append("\tmovq "+getReg(code[2],currFunc)+", -"+str(offset)+"(%rsp)")
                    if opMap[code[3]]=="cmp":
                        operator = code[3]
                    # assign the last reg as reg for a
                    reg=getReg(code[2],currFunc)
                    removeRegFromAddrDesc(reg)
                    removeAddrFromRegDesc(reg,code[2])
                    addRegDesc(reg,code[0])
                    addAddrDesc(code[0],reg)
                    removeTemp(code[4],currFunc)

            # form a = b
            if len(code)==3 and code[1]=="=" and code[2]!="PopParam":
                out.append("\t#  "+code[0]+" = "+code[2])
                out.append("\tmovq "+getReg(code[2],currFunc)+" ,"+getReg(code[0],currFunc))
                # check if a is a variable
                offset,flag=checkVar(code[0],currFunc)
                if flag:
                    out.append("\tmovq "+getReg(code[2],currFunc)+", -"+str(offset)+"(%rsp)")
                # remove entry of b from addrDesc of b
                removeTemp(code[2],currFunc)
            
            # form arr[ a ] = b
            if len(code)==5 and code[3]=="=" and code[2]=="]":
                out.append("\t#  "+code[0]+"["+code[1]+"] = "+code[4])
                out.append("\tmovq "+getReg(code[4], currFunc)+" ("+getReg(code[0][:-1],currFunc)+", "+getReg(code[1],currFunc)+", 8)")

            # form a = cast_to b
            if len(code)==4 and "cast_to_" in code[2]:
                out.append("\t#  "+code[0]+" = "+code[2]+" "+code[3])
                out.append("\t"+"movq "+getReg(code[3],currFunc)+" ,"+getReg(code[0],currFunc))
                # check if a is a variable
                offset,flag=checkVar(code[0],currFunc)
                if flag:
                    out.append("\tmovq "+getReg(code[2],currFunc)+", -"+str(offset)+"(%rsp)")
                removeTemp(code[3],currFunc)

            # form a = op b
            if len(code)==4 and code[1]=="=" and code[2] in unaryOpMap.keys():
                out.append("\t#  "+code[0]+" = "+code[2]+" "+code[3])
                out.append("\t"+unaryOpMap[code[2]]+" "+getReg(code[3],currFunc)+" ,"+getReg(code[0],currFunc))
                removeTemp(code[3],currFunc)

            # form a = call funcName
            if len(code)==4 and code[1]=="=" and code[2]=="call":
                for i in range(len(params)):
                    out.append("\tmovq "+getReg(params[i],currFunc)+", -"+str(i*8+16)+"(%rsp)")
                    removeTemp(params[i],currFunc)
                out.append("\t#  "+code[0]+" = "+code[2]+" "+code[3])
                out.append("\tcall "+"_".join(code[3].split("-")))
                out.append("\tmovq"+" %rax ,"+getReg(code[0],currFunc))
                params=[]
                removeTemp(code[3],currFunc)

            # form call funcName
            if len(code)==2 and code[0]=="call":
                for i in range(len(params)):
                    out.append("\tmovq "+getReg(params[i],currFunc)+", -"+str(i*8+16)+"(%rsp)")
                    removeTemp(params[i],currFunc)
                out.append("\t#  "+code[0]+" "+code[1])
                if code[1]=="Print":
                    out.append("\tmovq "+getReg(params[-1],currFunc)+", %rsi")
                    out.append("\tleaq .LCO(%rip), %rax")
                    out.append("\tmovq %rax, %rdi")
                    out.append("\tmovq $0, %rax")
                    out.append("\tcall printf@PLT")
                else:
                    out.append("\tcall "+"_".join(code[1].split("-")))    
                
                params=[]
            
            # form Return a
            if len(code)==2 and code[0]=="Return":
                out.append("\t#  "+code[0]+" "+code[1])
                out.append("\tpopq %rbp")
                out.append("\tmovq "+getReg(code[1],currFunc)+",%rax")
                removeTemp(code[1],currFunc)
                out.append("\tret")
            
            # if T goto Label
            if len(code)==4 and code[2]=="goto" and code[0]=="if":
                out.append("\t#  "+code[0]+" "+code[1]+" "+code[2]+" "+code[3])
                jmpLabel = ""
                for key in BBMap.keys():
                    if BBMap[key]==int(code[3]):
                        jmpLabel = key
                        break
                if operator == ">":
                    out.append("\tjle "+jmpLabel)
                elif operator == ">=":
                    out.append("\tjl "+jmpLabel)
                elif operator == "<":
                    out.append("\tjge "+jmpLabel)
                elif operator == "<=":
                    out.append("\tjg "+jmpLabel)
                elif operator == "==":
                    out.append("\tjne "+jmpLabel)
                elif operator == "!=":
                    out.append("\tje "+jmpLabel)
                removeTemp(code[0],currFunc)
            
            # form ra = PopParam
            if len(code)==3 and code[0]=="ra" and code[2]=="PopParam":
                out.append("\t# "+code[0]+" = "+code[2])
                out.append("\tpushq %rbp")
                out.append("\tmovq %rsp, %rbp")

            # form PushParam a
            if len(code)==2 and code[0]=="PushParam":
                if "call " not in threeAC[l[i]+j]:
                    out.append("\t#  "+code[0]+" "+code[1])
                    params.append(code[1]) 

            # form stackpointer +/- a
            if len(code)==2 and code[0]=="stackpointer":
                out.append("\t#  "+code[0]+" "+code[1])
                if code[1][0]=="+":
                    out.append("\tsubq $"+code[1][1:]+",%rsp")
                elif code[1][0]=="-":
                    out.append("\taddq $"+code[1]+",%rsp")
    

            with open("output/reg.csv","w") as f:
                for k in RegDesc.keys():
                    f.write(k+"".join([","+i for i in RegDesc[k]])+"\n")
            with open("output/addr.csv","w") as f:
                for k in AddrDesc.keys():
                    f.write(k+"".join([","+i for i in AddrDesc[k]])+"\n")
    
    out.append("\t#  Exit")
    out.append("\tpopq %rbp")
    out.append("\tmovq $60, %rax")
    out.append("\tsyscall")
    
    with open("output/x86.s","w") as f:
        for line in out:
            f.write(line+"\n")


if __name__ == "__main__":
    main()