#include <bits/stdc++.h>
using namespace std;

int num = 0;

typedef struct node{
    int id;
    bool exists;
    bool T;
    string val;
    vector<struct node *> list;
}NODE;

NODE* create_node(string val)
{
    NODE *element = (NODE *)calloc(1, sizeof(NODE));
    element->id = num++;
    element->val;
    return element;
}

void dfs(NODE*s, NODE*p)
{
    if(!s->list.size())
        return;
    for(auto &x:s->list)
    {
        if(x->exists)
            dfs(x, s);
        if(!s->T && x->T)
        s->val = x->val, s->T = true;
    }
    if(s->list.size()==1)
    {
        p->list.push_back(p->list[0]);
        s->exists = false;
    }
    // assign attribute of parent
}

int main()
{
    NODE *head;
    dfs(head, NULL);
}