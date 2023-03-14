#include "symbol_table.h"
#include <stdio.h>
using namespace std;

void insert_symbol(st table,char* token, char* lexeme, char* type, int line_num){
    table.token.push_back(token);
    table.lexeme.push_back(lexeme);
    table.type.push_back(type);
    table.line_num.push_back(line_num);
}

void print_symbol_table(st table){
    for(int i=0;i<table.token.size();i++){
        printf("%s\t%s\t%s\t%d\n",table.token[i],table.lexeme[i],table.type[i],table.line_num[i]);
    }
}

stl* make_st_node(string label, st* node, stl* prev){
    stl* new_node = new stl;
    new_node->label = label;
    new_node->node = node;
    new_node->prev = prev;
    return new_node;
}