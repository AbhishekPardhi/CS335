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
exp_reg = ['%rax','%rbx','%rcx','%rdx','%rsi','%rdi','%r8','%r9','%r10','%r11','%r12','%r13','%r14','%r15']
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
off_arr = {}

# "="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++"|"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>"|">>>"|"+="|"-="|"*="|"/="|"&="|"|="|"^="|"%="|"<<="|">>="|">>>="

def Initial():
    asm.append('.file\t"test.c"')
    asm.append('.text')
    asm.append('.section\t.rodata')
    asm.append('.LC0:')
    asm.append('.string\t"%d\\n"')
    asm.append('.text')
    asm.append('.globl\tmain')
    asm.append('.type\tmain, @function')

def Parse3AC(input_file):
    global exp_reg, asm, arg_reg, stk_max, stk, num_func, isMain, reg_num, off_arr

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
            asm.append(f'{tokens[1]}')
            asm.append('pushq\t%rbp')
            asm.append('movq\t%rsp, %rbp')
            num_args = 0
            pass_arg = 0
            stk_max = 0
            stk[f'FUNC_{num_func}']=0
            num_func+=1
            isMain = True if tokens[1][:-1]=="main" else False

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
            if isMain:
                asm.append('leave')
            else:
                asm.append('popq\t%rbp')
            asm.append('ret')

        elif tokens[1]=="PushParam":
            temp_tokens = lines[i+1].strip().split()
            # Argument for Print statement
            if temp_tokens[1]=="call" and temp_tokens[2]=="Print":
                asm.append(f'movq\t{stk[tokens[2]]}(%rbp), %rax')
                asm.append(f'movq\t%rax, %rsi')
            else:
                temp_lines=[]
                temp_lines.append(f'movq\t{Load(tokens[2])}, {arg_reg[pass_arg]}')
                pass_arg+=1

                for j in range(i+1, len(lines)):
                    next_line_tokens = lines[j].strip().split()
                    if next_line_tokens[1]=='PushParam':
                        temp_lines.append(f'movq\t{Load(next_line_tokens[2])}, {arg_reg[pass_arg]}')
                        pass_arg+=1
                        last_checked_line = j
                    else:
                        asm.extend(temp_lines[::-1])
                        break

        elif len(tokens)==4 and tokens[1]=="call" and tokens[2]=="Print":
            asm.append('leaq\t.LC0(%rip), %rdi')
            asm.append('movq\t$0, %rax')
            asm.append('call\tprintf@PLT')

        elif len(tokens)>=5 and tokens[3]=="call":
            asm.append(f'call\t{tokens[4]}')
            stk[tokens[1]]=stk_max
            stk_max-=reg_sz
            asm.append(f'movq\t%rax, {stk[tokens[1]]}(%rbp)')
            pass_arg = 0

        elif len(tokens)==5 and tokens[1]=="ifFalse":
            labels.append(tokens[-1])
            asm.append(f'cmp\t$0, {stk[tokens[2]]}(%rbp)')
            asm.append(f'je\t.L{tokens[-1]}')
        
        elif len(tokens)==3 and tokens[1]=="goto":
            labels.append(tokens[-1])
            asm.append(f'jmp\t.L{tokens[-1]}')
        
        elif len(tokens)==7 and tokens[3]=="heap_alloc":
            off_arr[tokens[1]] = str(-int(tokens[5])+stk_max)
            stk_max = int(off_arr[tokens[1]])

        elif tokens[2]=="=":
            if len(tokens)>4:
                Rx=Ry=""
                if '0'>tokens[3][0] or '9'<tokens[3][0]:
                    Rx = Load(tokens[3])
                elif tokens[3][-1]!=']':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    asm.append(f'movq\t${tokens[3]}, {Rx}')
                # Array access
                elif tokens[3][-1]==']':
                    arr, index = BreakArray(tokens[3])
                    reg_num = (reg_num+1)%len(exp_reg)
                    Rx = exp_reg[reg_num]
                    temp_reg = Load(index)
                    asm.append(f'movq\t{off_arr[arr]}(%rbp,{temp_reg},1), {Rx}')
                if '0'>tokens[5][0] or '9'<tokens[5][0]:
                    Ry = Load(tokens[5])
                elif tokens[5][-1]!=']':
                    reg_num = (reg_num+1)%len(exp_reg)
                    Ry = exp_reg[reg_num]
                    asm.append(f'movq\t${tokens[5]}, {Ry}')
                # Array access
                elif tokens[5][-1]==']':
                    arr, index = BreakArray(tokens[5])
                    reg_num = (reg_num+1)%len(exp_reg)
                    Ry = exp_reg[reg_num]
                    temp_reg = Load(index)
                    asm.append(f'movq\t{off_arr[arr]}(%rbp,{temp_reg},1), {Ry}')

                if tokens[4]=="+":
                    asm.append(f'addq\t{Rx}, {Ry}')
                elif tokens[4]=="*":
                    asm.append(f'imulq\t{Rx}, {Ry}')
                if tokens[4]=="-":
                    asm.append(f'subq\t{Ry}, {Rx}')
                    Ry=Rx
                # Will break if Ry=rax
                elif tokens[4]=="/":
                    asm.append(f'idivq\t{Ry}, %rax')
                    asm.append(f'idivq\t{Rx}')
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
                    asm.append(f'setl\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]=="<=":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setle\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]==">":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setg\t%al')
                    asm.append(f'movzx\t%al, %rax')
                    Ry='%rax'
                elif tokens[4]==">=":
                    asm.append(f'cmp \t{Rx}, {Ry}')
                    asm.append(f'setge\t%al')
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
                    asm.append(f'movq\t{off_arr[arr]}(%rbp,{temp_reg},1), {Rx}')
                else:
                    Rx = Load(tokens[3])
                
                if tokens[1][-1]=="]":
                    arr, index = BreakArray(tokens[1])
                    temp_reg = Load(index)
                    asm.append(f'movq\t{Rx}, {off_arr[arr]}(%rbp,{temp_reg},1)')
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
        asm.append(f'movq\t{reg}, {off_arr[arr]}(%rbp,{temp_reg},1)')
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

file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"

Initial()
Parse3AC(file_path+"x86_64/3AC.txt")
Printx86(file_path+"x86_64/x86.s")

print(stk)