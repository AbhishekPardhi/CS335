#ifndef NODE_H
#define NODE_H

#include <bits/stdc++.h>
// #include <instructions.h>
using namespace std;

typedef struct node{
    int     id;
    int     lineno;
    bool    isvar;
    char*   val;
    char*   type;
    char*   addr; 
    int ins; // stores the starting instruction number of the current node's code
    // vector<INSTRUCTION*> code; // stores 3AC code for the complete production of the node
    vector<int> truelist;
	vector<int> falselist;
	vector<int> nextlist;
    vector<struct node*> children;
}NODE;

NODE* create_node(int n_args, ...);

#endif // NODE_H