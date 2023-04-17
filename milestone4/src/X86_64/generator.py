import numpy as np

# Register Usage
# rax Return Value
# rbx Callee Saved
# rcx 4th Argument
# rdx 3rd Argument
# rsi 2nd Argument
# rdi 1st Argument
# rbp Callee Saved
# rsp Stack Pointer
# r8 5th Argument
# r9 6th Argument
# r10 Temporary
# r11 Temporary
# r12 Callee Saved
# r13 Callee Saved
# r14 Callee Saved
# r15 Callee Saved

def Parse3AC(input_file, output_file):
    global_done=False
    with open(input_file, 'r') as f:
        lines = f.readlines()

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


    
    with open(output_file, 'w') as f:
        for line in asm:
            if(line[-1]!=":"):
                f.write("\t")
            f.write(line)
            f.write("\n")

file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"
Parse3AC(file_path+"output/3AC.txt",file_path+"X86_64/x86.s")