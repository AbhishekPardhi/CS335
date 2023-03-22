#ifndef INSTRUCTION_H
#define INSTRUCTION_H

#include <bits/stdc++.h>
using namespace std;

typedef struct instruction{
    int index;
    char* code;
    instruction* hole;
}INSTRUCTION;

INSTRUCTION* create_instruction(string s);

#endif // INSTRUCTION_H