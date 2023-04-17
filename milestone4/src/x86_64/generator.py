import numpy as np
from utils import *

# Register Usage
# rsp Stack Pointer
# rax Return Value
# rdi 1st Argument
# rsi 2nd Argument
# rdx 3rd Argument
# rcx 4th Argument
# r8 5th Argument
# r9 6th Argument
# r10 Temporary
# r11 Temporary
# rbp Callee Saved
# rbx Callee Saved
# r12 Callee Saved
# r13 Callee Saved
# r14 Callee Saved
# r15 Callee Saved

# Expression registers
exp_reg = ['rax','rbx','rcx','rdx','rsi','rdi','rbp','r8','r9','r10','r11','r12','r13','r14','r15']

# Register Descriptor
reg_desc = {}

# Address Descriptor
addr_desc = {}

# Instructions -> vars -> [live, next_use]
ins_tuples = []

# Assembly code
asm = []

# Argument registers
arg_reg = ['rdi','rsi','rdx','rcx','r8','r9']

# Maximum Stack size in bytes
MAX_STACK = 1024

# Stores the pointer to empty space on stack
stack_space = 8

# Mapping of var/temps present on stack
stk = {}

# Array of stack positions available
stk_alloc = {}

def MakeRegDesc():
    global reg_desc, exp_reg, asm, arg_reg
    for reg in exp_reg:
        reg_desc[reg] = []


def Parse3AC(input_file, output_file):
    global reg_desc, addr_desc,ins_tuples

    global_done=False
    with open(input_file, 'r') as f:
        lines = f.readlines()

    ins_tuples = BuildNextUseTable(lines.copy())
    # with open("/home/scizor/Documents/Github/CS335-Project/milestone4/src/X86_64/NextUse.txt", 'w') as f:
    #     for tuple in tuples:
    #         for var in tuple:
    #             f.write(var+":"+str(tuple[var][0])+","+str(tuple[var][1])+"\t")
    #         f.write("\n")

    num_args = 0
    pass_arg = 0


    last_checked_line = -1

    for i, line in enumerate(lines):

        if i <= last_checked_line:
            continue

        tokens = line.strip().split()

        if tokens[1][-1] == ':':
            if global_done:
                asm.append(f'globl {tokens[1][:-1]}')
            asm.append(f'{tokens[1]}')
            global_done=False
            num_args=0
            pass_arg=0

        elif tokens[-1]=="PopParam":
            if tokens[1]=="ra":
                asm.append('push rbp')
                asm.append('mov rbp, rsp')
            else:
                asm.append(f'mov {arg_reg[num_args]}, [ebp + {(num_args+1)*8}]')
                Link(tokens[1],arg_reg[num_args])
                num_args+=1
                # Don't forget to store the remaining args on stack
                # Remove below line
                StoreToStack(tokens[1],arg_reg[num_args-1])
                

        elif tokens[1]=="Goto" and tokens[2]=="ra":
            asm.append('pop rbp')
            asm.append('ret')

        elif tokens[1]=="PushParam":
            temp_lines=[]
            temp_lines.append(f'mov {arg_reg[pass_arg]}, {tokens[2]}')
            pass_arg+=1

            for j in range(i+1, len(lines)):
                next_line_tokens = lines[j].strip().split()
                if next_line_tokens[1]=='PushParam':
                    temp_lines.append(f'mov {arg_reg[pass_arg]}, {next_line_tokens[2]}')
                    pass_arg+=1
                    last_checked_line = j
                else:
                    asm.extend(temp_lines[::-1])
                    break

        elif len(tokens)>=4 and tokens[3]=="call":
            asm.append(tokens[3]+" "+tokens[4])

        elif len(tokens)>=6 and tokens[4]=="+":
            Rx = getreg(tokens[3], i)
            Ry = getreg(tokens[5], i)

            if not FindInRegDesc(tokens[3], Rx):
                LoadFromStack(Rx,tokens[3])

            if not FindInRegDesc(tokens[5], Ry):
                LoadFromStack(Ry,tokens[5])

            asm.append(f'add {Rx}, {Ry}')

            addr_desc[tokens[1]] = [Rx]
            reg_desc[Rx] = [tokens[1]]


        elif len(tokens)>=4 and tokens[2]=="=" and tokens[3]!="PopParam":
            Rx = getreg(tokens[1], i)
            Ry = getreg(tokens[3], i)

            if not FindInRegDesc(tokens[3], Ry):
                LoadFromStack(Ry,tokens[3])

            asm.append(f'mov {Rx}, {Ry}')

            addr_desc[tokens[1]] = [Rx]
            reg_desc[Rx] = [tokens[1]]

    
    with open(output_file, 'w') as f:
        for line in asm:
            if(line[-1]!=":"):
                f.write("\t")
            f.write(line)
            f.write("\n")


def FindInRegDesc(tok,reg):
    found = False
    for var in reg_desc[reg]:
        if tok == var:
            found = True
            break
    return found

def LoadFromStack(reg,var):
    asm.append(f'mov {reg}, {stk[var]}[rbp]')
    Link(var,reg)

def StoreToStack(var,reg):
    stk[var] = -FindNextStk()
    asm.append(f'mov {stk[var]}[rbp], {reg}')

def Link(var,reg):
    global reg_desc, addr_desc

    if var not in addr_desc:
        addr_desc[var] = []
    if reg not in reg_desc:
        reg_desc[reg] = []

    addr_desc[var].append(reg)
    reg_desc[reg].append(var)

def  getreg(x, ins):
    global reg_desc, addr_desc

    cont_reg = ""
    empty_reg = ""
    for reg in reg_desc:
        if x in reg_desc[reg]:
            cont_reg = reg
        if len(reg_desc[reg])==0 and empty_reg!="":
            empty_reg = reg

    # If x is in a register, then return the register containing x as Rx
    if cont_reg != "":
        return cont_reg
    # If x is not in a register, but there is an empty register available, then pick one such register as Rx
    elif empty_reg != "":
        return empty_reg
    # If x is not in a register and there are no empty registers, then
    else:
        # Heuristic for candidate selection is based on fewest next use
        # few_reg = ""
        # fewest_nextuse = 1e9
        # for reg in reg_desc:
        #     nextuse = 0
        #     for var in reg_desc[reg]:
        #         nextuse += 1 if ins_tuples[ins][var][0] else 0
        #     if nextuse < fewest_nextuse:
        #         few_reg = reg
        #         fewest_nextuse = nextuse
        
        cand_reg = ""
        min_cost = 1e9
        add_asm = []
        for reg in reg_desc:
            cost = 0
            temp_asm = []
            for var in reg_desc[reg]:
                other = False
                for reg in addr_desc[var]:
                    if reg != reg:
                        other = True
                        break
                # If the address descriptor for v says that v is somewhere else beside R, then choose R
                if other == True:
                    continue
                # If v is x, and x is not an operand of I (i.e., x != z), then choose R
                ### Implement this
                # If v is not used later, then choose R
                if not ins_tuples[ins][var][0]:
                    continue
                # Else, generate ST v, R (called a register spill)
                # asm.append(f'mov -8[rbp], {reg}')
                temp_asm.append(StoreToStack(var,reg))

                cost += 1
            
            if cost < min_cost:
                cand_reg = reg
                min_cost = cost
                add_asm = temp_asm
        
        for line in add_asm:
            asm.append(line)

        for var in reg_desc[reg]:
            addr_desc[var].remove(reg)
        
        return cand_reg

# Finds next empty space on stack
def FindNextStk():
    for i in range(0,MAX_STACK,8):
        if stk_alloc[i] == False:
            stk_alloc[i] = True
            return i
    
    print("Error: Out of stack allocs")

file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"

def MakeStack():
    for i in range(0,MAX_STACK,8):
        stk_alloc[i] = False

MakeRegDesc()
MakeStack()
Parse3AC(file_path+"x86_64/3AC.txt",file_path+"x86_64/x86.s")