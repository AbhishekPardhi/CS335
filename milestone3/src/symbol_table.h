#include<bits/stdc++.h>

using namespace std;

typedef struct symbol_table_map_entry stme;

typedef struct symbol_table_entry{
    string token, lexeme, type;
    int lineno,offset;
    vector < int > dims;
    struct symbol_table_entry* next;
    struct symbol_table_entry* prev;
    struct symbol_table_entry* next_scope;
    struct symbol_table_entry* prev_scope;    
    stme * class_entry;
} ste ;

typedef struct symbol_table_map_entry {
    ste* entry;
    string return_type,id;
    vector<string> implements;
    int num_params;
    struct symbol_table_map_entry * next;
} stme;