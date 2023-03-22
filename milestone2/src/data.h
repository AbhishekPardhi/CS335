#ifndef NODE_H
#define NODE_H

#include <bits/stdc++.h>
using namespace std;

typedef struct node{
    int id;
    int lineno;
    bool isvar;
    char* val;
    char* type;
    vector<struct node*> children;
}NODE;

NODE* create_node(int n_args, ...);

#endif // NODE_H