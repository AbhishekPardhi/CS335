import numpy as np
import math
from utils import *
import os

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
# exp_reg = ['%rax','%rbx','%rcx','%rdx','%rsi','%rdi','%r8','%r9','%r10','%r11','%r12','%r13','%r14','%r15']
exp_reg = ['%rax','%rbx','%r10','%r11','%r12','%r13','%r14','%r15']
callee_saved_reg = ['%rbp','%rbx','%r12','%r13','%r14','%r15']
reg_num = 0
num_func = 0
reg_sz = 8

# Assembly code
asm = []

# Argument registers
arg_reg = ['%rdi','%rsi','%rdx','%rcx','%r8','%r9']

# Current stack max
stk_max = 0

# Mapping of var/temps present on stack
stk = {}

# Counts the number of strings
LC_count = 0

# Is current function main?
isMain =False

# Stores new labels
labels = []

# Offset of arrays
offset = {}

# Fields Dictionary-> field : [obj, var_offset]
fields = {}

# Current function
curr_func = ""

# Stackchange
stk_pos = []

# Strings Mapping
str_map = {}

# Function-strings mapping
func_str_map = {}

# String to print
print_str = ""

# Class name
class_name = ""

# "="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++"|"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>"|">>>"|"+="|"-="|"*="|"/="|"&="|"|="|"^="|"%="|"<<="|">>="|">>>="

def Initial():
    asm.append('.file\t"test.java"')
    asm.append('.text')
    # asm.append('.section\t.rodata')
    asm.append('.LC0:')
    asm.append('.string\t"%d\\n"')

def Parse3AC(input_file):
    global exp_reg, asm, arg_reg, stk_max, stk, num_func, isMain, reg_num, offset, stk_pos, print_str, func_str_map, str_map

    num_args = 0
    pass_arg = 0

    with open(input_file, 'r') as f:
        lines = f.readlines()

    last_checked_line = -1

    for i,line in enumerate(lines):

        if i <= last_checked_line:
            continue

        tokens = line.strip().split()
        if tokens[0] in labels:
            asm.append('.L'+tokens[0]+':')

        if tokens[1][-1] == ':':
            function_sep = tokens[1].strip().split('-')
            func_name = function_sep[1]

            for func_str in func_str_map[func_name[:-1]]:
                asm.append(f'.STR{str_map[func_str]}:')
                asm.append(f'.string\t{func_str}')

            asm.append('.text')
            asm.append(f'.globl\t{func_name[:-1]}')
            asm.append(f'.type\t{func_name[:-1]}, @function')

            asm.append(f'{func_name}')
            for csreg in callee_saved_reg:
                asm.append(f'pushq\t{csreg}')
            # asm.append(f'pushq\t%rbp')
            asm.append('movq\t%rsp, %rbp')
            num_args = 0
            pass_arg = 0


            for pos in stk_pos:
                if pos>0:
                    asm[pos-1]=f"addq\t${-stk_max}, %rsp"
                else:
                    asm[-pos-1]=f"subq\t${-stk_max}, %rsp"

            stk_pos = []
            stk_max = 0

            # # New stack
            # if len(stk):
            #     print(stk)

            stk = {}

            stk[f'FUNC_{num_func}']=0
            num_func+=1
            isMain = True if func_name[:-1]=="main" else False
            curr_func = tokens[1][:-1]
            # diff = math.ceil(FuncOffset(curr_func)/16)*16
            # asm.append(f'subq\t${FuncOffset(curr_func)}, %rsp')
            asm.append(f'subq\t$16, %rsp')
            stk_pos.append(-len(asm))


        elif tokens[-1]=="PopParam":
            if tokens[1]=="ra":
                pass
            else:
                if(num_args<6):
                    asm.append(f'movq\t{arg_reg[num_args]}, -{(num_args+1)*reg_sz}(%rbp)')
                    stk[tokens[1]] = -(num_args+1)*reg_sz
                    num_args += 1
                    stk_max -= reg_sz

        elif len(tokens)==3 and tokens[1]=="Return":
            asm.append(f'movq\t{stk[tokens[2]]}(%rbp), %rax')

        elif tokens[1]=="Goto" and tokens[2]=="ra":
            # asm.append(f'addq\t${FuncOffset(curr_func)}, %rsp')
            asm.append(f'addq\t$16, %rsp')
            stk_pos.append(len(asm))
            temp_lines = []
            for csreg in callee_saved_reg:
                temp_lines.append(f'popq\t{csreg}')
            asm.extend(temp_lines[::-1])
            # asm.append(f'popq\t%rbp')
            if isMain:
                # asm.append('leave')
                # asm.append('movq\t$60, %rax')
                asm.append('movq\t$0, %rax')
                asm.append('syscall')
                for pos in stk_pos:
                    if pos>0:
                        asm[pos-1]=f"addq\t${-stk_max}, %rsp"
                    else:
                        asm[-pos-1]=f"subq\t${-stk_max}, %rsp"

                # # New stack
                # print(stk)
                # stk={}

            asm.append('retq')

        elif tokens[1]=="PushParam":
            temp_tokens = lines[i+1].strip().split()
            # Argument for Print statement
            if temp_tokens[1]=="call" and temp_tokens[2]=="Print":
                if tokens[2][0]=='"':
                    for k in range(2,len(tokens)):
                        print_str += tokens[k]+' '
                elif tokens[2] in stk:
                    asm.append(f'movq\t{stk[tokens[2]]}(%rbp), %rax')
                elif tokens[2][0]=="*":
                    Rx = "%rax"
                    [obj, var_offset] = fields[tokens[2]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{offset[obj]}(%rbp,{temp_reg},1), {Rx}')
                elif '0'<=tokens[2][0] and tokens[2][0]<='9':
                    asm.append(f'movq\t${tokens[2]}, %rax')
                asm.append(f'movq\t%rax, %rsi')
            else:
                temp_lines=[]
                Rx=""
                if '0'<=tokens[2][0] and tokens[2][0]<='9':
                    Rx = LoadNumber(tokens[2])
                elif tokens[2][0]=="*":
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    [obj, var_offset] = fields[tokens[2]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{offset[obj]}(%rbp,{temp_reg},1), {Rx}')
                else:
                    Rx = Load(tokens[2])
                temp_lines.append(f'movq\t{Rx}, {arg_reg[pass_arg]}')
                pass_arg+=1

                for j in range(i+1, len(lines)):
                    next_line_tokens = lines[j].strip().split()
                    if next_line_tokens[1]=='PushParam':
                        Rx=""
                        if '0'<=next_line_tokens[2][0] and next_line_tokens[2][0]<='9':
                            Rx = LoadNumber(next_line_tokens[2])
                        else:
                            Rx = Load(next_line_tokens[2])
                        temp_lines.append(f'movq\t{Rx}, {arg_reg[pass_arg]}')
                        pass_arg+=1
                        last_checked_line = j
                    else:
                        asm.extend(temp_lines[::-1])
                        break

        elif len(tokens)==3 and tokens[1]=="call" and tokens[2]=="Print":
            if print_str == "":
                asm.append('leaq\t.LC0(%rip), %rdi')
            else:
                asm.append(f'leaq\t.STR{str_map[print_str]}(%rip), %rdi')
                print_str=""
            asm.append('movq\t$0, %rax')
            asm.append('call\tprintf@PLT')

        elif len(tokens)==5 and tokens[3]=="call":
            function_sep = tokens[4].strip().split('-')
            func_name = function_sep[1]
            asm.append(f'call\t{func_name}')
            stk_max-=reg_sz
            stk[tokens[1]]=stk_max
            asm.append(f'movq\t%rax, {stk[tokens[1]]}(%rbp)')
            pass_arg = 0

        elif len(tokens)==5 and tokens[1]=="if":
            asm.append(f'cmp \t$0, {stk[tokens[2]]}(%rbp)')
            asm.append(f'jne  \t.L{tokens[-1]}')
        
        elif len(tokens)==3 and tokens[1]=="goto":
            asm.append(f'jmp\t.L{tokens[-1]}')
        
        elif len(tokens)==7 and tokens[3]=="heap_alloc":
            temp_tokens = lines[i+1].strip().split()
            offset[temp_tokens[1]] = str(-int(tokens[5])+stk_max)
            stk_max = int(offset[temp_tokens[1]])
            last_checked_line = i+1

        elif len(tokens)==9 and tokens[3]=="symtable":
            var_offset = SymTable(tokens[5],tokens[7])
            temp_tokens = lines[i+1].strip().split()
            fields['*'+temp_tokens[1]] = [temp_tokens[3], var_offset]
            last_checked_line = i+1

        elif tokens[2]=="=":
            if len(tokens)>4:
                Rx=Ry=""
                if '0'<=tokens[3][0] and tokens[3][0]<='9':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    asm.append(f'movq\t${tokens[3]}, {Rx}')
                # Array access
                elif tokens[3][-1]==']':
                    arr, index = BreakArray(tokens[3])
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    temp_reg = Load(index)
                    asm.append(f'movq\t{offset[arr]}(%rbp,{temp_reg},1), {Rx}')
                # Field access
                elif tokens[3][0]=='*':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    [obj, var_offset] = fields[tokens[3]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{offset[obj]}(%rbp,{temp_reg},1), {Rx}')
                else:
                    Rx = Load(tokens[3])

                if '0'<=tokens[5][0] and tokens[5][0]<='9':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Ry = exp_reg[reg_num]
                    asm.append(f'movq\t${tokens[5]}, {Ry}')
                # Array access
                elif tokens[5][-1]==']':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Ry = exp_reg[reg_num]
                    arr, index = BreakArray(tokens[5])
                    temp_reg = Load(index)
                    asm.append(f'movq\t{offset[arr]}(%rbp,{temp_reg},1), {Ry}')
                # Field access
                elif tokens[5][0]=='*':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Ry = exp_reg[reg_num]
                    [obj, var_offset] = fields[tokens[5]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{offset[obj]}(%rbp,{temp_reg},1), {Ry}')
                else:
                    Ry = Load(tokens[5])

                if tokens[4]=="+":
                    asm.append(f'addq\t{Rx}, {Ry}')
                elif tokens[4]=="*":
                    asm.append(f'imulq\t{Rx}, {Ry}')
                if tokens[4]=="-":
                    asm.append(f'subq\t{Ry}, {Rx}')
                    Ry=Rx
                # Will break if Ry=rax
                elif tokens[4]=="/":
                    asm.append(f'movq\t{Ry}, %rax')
                    asm.append(f'xor \t%rdx, %rdx')
                    asm.append(f'idivq\t{Rx}')
                    Ry='%rax'
                elif tokens[4]=="==":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'sete\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]=="!=":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setge\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]=="<":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setg\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]=="<=":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setge\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]==">":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setl\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]==">=":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setle\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                Store(tokens[1],Ry)
            else:                
                Rx = ""
                if '0'<=tokens[3][0] and tokens[3][0]<='9':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    asm.append(f'movq\t${tokens[3]}, {Rx}')
                elif tokens[3][-1]==']':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    arr, index = BreakArray(tokens[3])
                    temp_reg = Load(index)
                    asm.append(f'movq\t{offset[arr]}(%rbp,{temp_reg},1), {Rx}')
                elif tokens[3][0]=='*':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    [obj, var_offset] = fields[tokens[3]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{offset[obj]}(%rbp,{temp_reg},1), {Rx}')
                else:
                    Rx = Load(tokens[3])
                
                if tokens[1][-1]=="]":
                    arr, index = BreakArray(tokens[1])
                    temp_reg = Load(index)
                    asm.append(f'movq\t{Rx}, {offset[arr]}(%rbp,{temp_reg},1)')
                elif  tokens[1][0]=="*":
                    [obj, var_offset] = fields[tokens[1]]
                    temp_reg = LoadNumber(var_offset)
                    asm.append(f'movq\t{Rx}, {offset[obj]}(%rbp,{temp_reg},1)')
                else:
                    if tokens[1] not in stk:
                        stk_max -= reg_sz
                        stk[tokens[1]]=stk_max
                    asm.append(f'movq\t{Rx}, {stk[tokens[1]]}(%rbp)')


def Load(var):
    global asm, reg_num, stk, exp_reg
    reg_num = (reg_num+1)%len(exp_reg)
    asm.append(f'movq\t{stk[var]}(%rbp), {exp_reg[reg_num]}')
    return exp_reg[reg_num]

def Store(var, reg):
    global asm, stk_max, stk
    # Array access
    if var[-1]==']':
        arr, index = BreakArray(var)
        temp_reg = Load(index)
        asm.append(f'movq\t{reg}, {offset[arr]}(%rbp,{temp_reg},1)')
    else:
        if var not in stk:
            stk_max -= reg_sz
            stk[var] = stk_max
        asm.append(f'movq\t{reg}, {stk[var]}(%rbp)')

def Printx86(output_file):
    global asm
    with open(output_file, 'w') as f:
        for line in asm:
            if(line[-1]!=":"):
                f.write("\t")
            f.write(line)
            f.write("\n")

def LoadNumber(number):
    global reg_num, exp_reg, asm
    reg_num = (reg_num+1)%len(exp_reg)
    Rx = exp_reg[reg_num]
    asm.append(f'movq\t${number}, {Rx}')
    return Rx

def FindLabels(input_file):
    global labels, str_map, func_str_map, class_name

    with open(input_file, 'r') as f:
        lines = f.readlines()

    func_name=""
    strs = 0

    for line in lines:
        tokens = line.strip().split()
        if tokens[1][-1] == ':':
            function_sep = tokens[1].strip().split('-')
            func_name = function_sep[1][:-1]
            class_name = function_sep[0]
            strs = 0
            func_str_map[func_name]=[]
        if len(tokens)==3 and tokens[1]=="goto":
            labels.append(tokens[-1])
        elif len(tokens)==5 and tokens[1]=="if":
            labels.append(tokens[-1])
        elif tokens[1]=="PushParam" and tokens[2][0]=='"':
            print_str = ""
            for k in range(2,len(tokens)):
                print_str += tokens[k]+' '
            str_map[print_str] = f'{func_name}'+str(strs)
            strs += 1
            func_str_map[func_name].append(print_str)

cwd = os.getcwd()
file_path = cwd
# file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"
input_path = file_path+"/output/3AC.txt"
output_path = file_path+"/output/x86.s"

Initial()
FindLabels(input_path)
FetchFieldDecl(file_path, class_name)
Parse3AC(input_path)
Printx86(output_path)