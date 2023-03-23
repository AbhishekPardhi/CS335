#include "data.h"
#include <cstdarg>

int num=0;

NODE* create_node(int n_args, ...)
{
    NODE *element = (NODE *)calloc(1, sizeof(NODE));
    element->id=num++;
    element->type="";

    string s="";
    char* temp=new char[1];
    strcpy(temp, s.c_str());
    element->type=temp;
    
    NODE*child;
    va_list valist;
    va_start(valist, n_args); 
    element->val = strdup(va_arg(valist, const char*));
    element->addr = element->val;
    for (int i = 1; i < n_args; i++) {
        child = va_arg(valist, NODE*);
        element->children.push_back(child);
    }
    va_end(valist);

    return element;
}