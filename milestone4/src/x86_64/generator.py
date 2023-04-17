import numpy as np
from data import *

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

exp_reg = ['rax','rbx','rcx','rdx','rsi','rdi','rbp','r8','r9','r10','r11','r12','r13','r14','r15']

# Register Descriptor
reg_desc = {}

# Address Descriptor
addr_desc = {}

# 
ins_tuples = []

def MakeRegDesc():
    global reg_desc, exp_reg
    for reg in exp_reg:
        reg_desc[reg] = [0]


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

    asm = []
    arg_reg = ['rdi','rsi','rdx','rcx','r8','r9']
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
            Rx, Ry = getreg(tokens[3],tokens[5])
            asm.append(f'add {Rx}, {Ry}')


    
    with open(output_file, 'w') as f:
        for line in asm:
            if(line[-1]!=":"):
                f.write("\t")
            f.write(line)
            f.write("\n")


def Link(var,reg):
    global reg_desc, addr_desc

    if var not in addr_desc:
        addr_desc[var] = []
    if var not in addr_desc:
        addr_desc[var] = []

    addr_desc[var].append(reg)
    reg_desc[reg].append(var)

def  getreg(x, y):
    global reg_desc, addr_desc

    # Find the register that has max cost (farthest reference) from the address descriptor
    ref1 = ''
    max_val = float('-inf')
    for i in range(len(addr_desc[x])):
        if reg_desc[addr_desc[x][i]][0] > max_val:
            max_val = reg_desc[addr_desc[x][i]][0]
            ref1 = addr_desc[x][i]

    ref2 = ''
    max_val = float('-inf')
    for i in range(len(addr_desc[y])):
        if reg_desc[addr_desc[y][i]][0] > max_val:
            max_val = reg_desc[addr_desc[y][i]][0]
            ref2 = addr_desc[y][i]

    ### Don't forget to update the reg_desc, addr_desc and cost

    if reg_desc[ref1][0] >= reg_desc[ref1][0]:
        return ref1, ref2
    else:
        return ref2, ref1

file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"

MakeRegDesc()
Parse3AC(file_path+"X86_64/3AC.txt",file_path+"X86_64/x86.s")