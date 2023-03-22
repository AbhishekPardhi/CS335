#include "data.h"

INSTRUCTION* create_instruction(string s)
{
    INSTRUCTION *element = (INSTRUCTION *)calloc(1, sizeof(INSTRUCTION));
    char* result_chr = new char[s.size()+1];
    strcpy(result_chr,s.c_str());
    INSTRUCTION->code = result_chr;
    return element;
}