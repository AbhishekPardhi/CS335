#ifndef NODE_H
#define NODE_H

#include <vector>
using namespace std;

typedef struct node{
    int id;
    char* val;
    vector<struct node*> children;
}NODE;

NODE* create_node(int n_args, ...);

#endif // NODE_H