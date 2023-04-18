from utils import *
from constants import *

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

def getParamReg(name , currFunc):
    for reg in paramMap.keys():
        if RegDesc[paramMap[reg]]==[]:
            offset,isVar = checkVar(name,currFunc)
            if isVar:
                out.append("\t"+"mov "+"%rsp[-"+str(offset)+"], "+paramMap[reg])
                addRegDesc(paramMap[reg],name)
                addAddrDesc(name,"%rsp[-"+str(offset)+"]")
                addAddrDesc(name,paramMap[reg])
            else:
                if name[0] == "t":
                    addAddrDesc(name,paramMap[reg])
                    addRegDesc(paramMap[reg],name)
                else:
                    out.append("\t"+"mov "+name+","+paramMap[reg])
                    addAddrDesc(name,paramMap[reg])
                    addRegDesc(paramMap[reg],name)
            return paramMap[reg]
        
    return "NONE"

def getReg(name,currFunc):
    # case when the variable is already in the register
    if name in AddrDesc.keys():
        # check if name is a variable
        offset,isVar = checkVar(name,currFunc)
        if AddrDesc[name][-1][-1]!="]" and isVar:
            return AddrDesc[name][-1]
        elif isVar==False:
            return AddrDesc[name][-1]
    
    # case when the variable is not in the register
    for reg in RegDesc.keys():
        if RegDesc[reg]==[]:
            offset,isVar = checkVar(name,currFunc)
            if isVar:
                out.append("\t"+"mov "+"%rsp[-"+str(offset)+"], "+reg)
                addRegDesc(reg,name)
                addAddrDesc(name,"%rsp[-"+str(offset)+"]")
                addAddrDesc(name,reg)
            else:
                if name[0] == "t":
                    if name in tempOffsetMap.keys():
                        out.append("\t"+"mov "+" %rsp[+"+str(tempOffsetMap[name])+"] "+reg)
                    addAddrDesc(name,reg)
                    addRegDesc(reg,name)
                else:
                    out.append("\t"+"mov "+name+","+reg)
                    addAddrDesc(name,reg)
                    addRegDesc(reg,name)
            return reg
    
    # case when all the registers are full
    for id in AddrDesc.keys():
        # find a variable which is also stored in a reg
        if AddrDesc[id][0][-1]!="]" and len(AddrDesc[id])!=1:
            reg=AddrDesc[id][1]
            # remove reg from all other AddrDesc and RegDesc
            removeRegFromAddrDesc(reg)
            RegDesc[reg].remove(id)
            # add the new variable to the reg
            AddrDesc[name]=[]
            AddrDesc[name].append(reg)
            RegDesc[reg].append(name)
            return reg

    # store some values from RegDesc above the stack and use the reg for new variables
    for addr in AddrDesc.keys():
        #check if add is not a variable
        offset,isVar = checkVar(addr,currFunc)
        if isVar==False:
            # check if the variable is stored in a register
            if AddrDesc[addr][-1][-1]!="]":
                reg=AddrDesc[addr][-1]
                # remove the variable from the register
                RegDesc[reg].remove(addr)
                # remove the reg from all the AddrDesc
                removeRegFromAddrDesc(reg)
                # store the variable above the stack
                out.append("\t"+"mov "+reg+", %rsp[+"+str(8*len(tempOffsetMap))+"]")
                # get the offset of the variable
                var_offset,temp= checkVar(name,currFunc)
                # add the new variable to the register
                if name not in AddrDesc.keys():
                    AddrDesc[name]=[]
                # AddrDesc[name].append("%rsp[+"+str(var_offset))+"]"
                AddrDesc[name].append(reg)
                # add the variable to the tempOffsetMap
                tempOffsetMap[addr]=8*len(tempOffsetMap)
                if temp:
                    RegDesc[reg].append(name)
                    out.append("\t"+"mov "+"sp[-"+str(var_offset)+"] "+reg)
                else:
                    print("ID is not a variable")
                return reg


    print("All registers are full, no variable to spill")
    

    return "NONE"
    