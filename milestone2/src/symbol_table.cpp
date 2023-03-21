#include "symbol_table.h"

void insert_entry(ste* cur,string token,string lexeme,string type,int lineno,int dim)
{
    ste* new_entry = new ste;
    new_entry->token = token;
    new_entry->lexeme = lexeme;
    new_entry->type = type;
    new_entry->lineno = lineno;
    new_entry->dim = dim;
    new_entry->next = NULL;
    new_entry->prev = cur;
    new_entry->next_scope = NULL;
    new_entry->prev_scope = NULL;
    ;

}