#include "symbol_table.h"

ste* insert_entry(ste* cur,string token,string lexeme,string type,int lineno,int dim)
{
    ste* new_entry = new ste;
    new_entry->token = token;
    new_entry->lexeme = lexeme;
    new_entry->type = type;
    new_entry->lineno = lineno;
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
    cout<<cur->lexeme<<" "<<cur->type<<" "<<cur->offset<<endl;
    if (cur->next_scope != NULL)
    {
        print_ste(cur->next_scope,level+1);
    }
    if (cur->next != NULL)
    {
        print_ste(cur->next,level);
    }

}

ste* checkRedeclaration(ste* node, string lexeme)
{
    if (node->type=="global_head")
        return NULL;
    if (node->lexeme==lexeme)
        return node;
    if (node->prev!=NULL)
        return checkRedeclaration(node->prev,lexeme);
    return NULL;
}

ste* lookup(ste* node, string lexeme)
{
    if (node->type=="global_head")
        return NULL;
    if (node->lexeme==lexeme)
        return node;
    if (node->prev!=NULL)
        return lookup(node->prev,lexeme);
    if (node->prev_scope!=NULL)
        return lookup(node->prev_scope,lexeme);
    return NULL;
}

stme* lookupFunction(stme* node, string funcName){
    if (node->id==funcName)
        return node;
    if (node->next!=NULL)
        return lookupFunction(node->next,funcName);
    return NULL;
}

int getOffset(string type){

    unordered_map < string, int > typeSize;
    typeSize["byte"] = 1;
    typeSize["short"] = 2;
    typeSize["int"] = 4;
    typeSize["long"] = 8;
    typeSize["float"] = 4;
    typeSize["double"] = 8;
    typeSize["boolean"] = 1;
    typeSize["char"] = 2;
    typeSize["void"] = 0;
    typeSize["ptr"] = 4;

    while(type[type.size()-1]==']'){
        type = type.substr(0,type.size()-2);
    }

    if (typeSize.find(type)==typeSize.end())
        return typeSize["ptr"];

    return typeSize[type];
}
    