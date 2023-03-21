#include "symbol_table.h"

ste* insert_entry(ste* cur,string token,string lexeme,string type,int lineno,int dim)
{
    ste* new_entry = new ste;
    new_entry->token = token;
    new_entry->lexeme = lexeme;
    new_entry->type = type;
    new_entry->lineno = lineno;
    new_entry->dim = dim;
    new_entry->next = NULL;
    new_entry->prev = cur;
    cur->next = new_entry;
    new_entry->next_scope = NULL;
    new_entry->prev_scope = NULL;
    return new_entry;
}

void print_ste(ste* cur,int level=0)
{
    for (int i = 0; i < level; i++)
    {
        cout<<"-> ";
    }
    cout<<cur->lexeme<<" "<<cur->type<<endl;
    if (cur->next_scope != NULL)
    {
        print_ste(cur->next_scope,level+1);
    }
    if (cur->next != NULL)
    {
        print_ste(cur->next,level);
    }

}
