#include<bits/stdc++.h>

using namespace std;

typedef struct symbol_table_entry{
    string token, lexeme, type;
    int lineno,dim;
    struct symbol_table_entry* next;
    struct symbol_table_entry* prev;
    struct symbol_table_entry* next_scope;
    struct symbol_table_entry* prev_scope;    
} ste ;

typedef struct symbol_table_map_entry {
    ste* entry;
    string return_type;
    int num_params;
} stme;