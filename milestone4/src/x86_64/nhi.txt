def convert_3ac_to_asm_64(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()

    asm_lines = []
    for i, line in enumerate(lines):
        tokens = line.strip().split()

        if tokens[1] == 'BeginFunc':
            asm_lines.append(f'.globl {tokens[0]}')
            asm_lines.append(f'{tokens[0]}:')
            asm_lines.append('pushq %rbp')
            asm_lines.append('movq %rsp, %rbp')
            asm_lines.append(f'subq 24, %rsp')
        elif tokens[1] == 'EndFunc':
            asm_lines.append('.LFE{}:'.format(i))
            asm_lines.append('movq %rbp, %rsp')
            asm_lines.append('popq %rbp')
            asm_lines.append('ret')
        elif tokens[1] == 'PushParam':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append('pushq %rax')
        elif tokens[1] == 'PopParam':
            asm_lines.append('popq %rax')
            asm_lines.append(f'movq %rax, {tokens[2]}(%rbp)')
        elif tokens[1] == '=':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append(f'movq %rax, {tokens[0]}(%rbp)')
        elif tokens[1] == '+':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append(f'addq {tokens[3]}(%rbp), %rax')
            asm_lines.append(f'movq %rax, {tokens[0]}(%rbp)')
        elif tokens[1] == '*':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append('cqto')
            asm_lines.append(f'imulq {tokens[3]}(%rbp), %rax')
            asm_lines.append(f'movq %rax, {tokens[0]}(%rbp)')
        elif tokens[1] == 'Call':
            asm_lines.append('call {}'.format(tokens[2]))
            asm_lines.append(f'movq %rax, {tokens[0]}(%rbp)')
        elif tokens[1] == 'Goto':
            asm_lines.append('jmp {}'.format(tokens[2]))
        elif tokens[1] == 'Return':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append('jmp {}'.format(tokens[0]))
        elif tokens[1] == '==' or tokens[1] == '!=' or tokens[1] == '<=' or tokens[1] == '>=' or tokens[1] == '<' or tokens[1] == '>':
            asm_lines.append(f'movq {tokens[2]}(%rbp), %rax')
            asm_lines.append(f'cmpq {tokens[3]}(%rbp), %rax')
            asm_lines.append(f'movl ${0}, %eax')
            asm_lines.append(f'set{tokens[1][0:2].lower()} %al')
            asm_lines.append(f'movzbl %al, %eax')
            asm_lines.append(f'movq %rax, {tokens[0]}(%rbp)')

    f.close()

    with open(output_file, 'w') as f:
        for line in asm_lines:
            f.write(line)
            f.write("\n")


file_path = "/home/scizor/Documents/Github/CS335-Project/milestone4/src/"
convert_3ac_to_asm_64(file_path+"output/3AC.txt",file_path+"X86_64/x86.s")