#include <bits/stdc++.h>
using namespace std;

int num = 0;
ofstream fout("./result.dot");

typedef struct node{
    int id;
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

NODE *head;

input:
    exp EOL     {
                    $$ = $1;
                    head = $$;
                }
;

E:
    E PLUS T    {
                    NODE *cell = create_node($2->val);
                    cell->list = {$1, $2};
                    $$ = cell;
                }
;

E:
    T       {
                $$ = $1;
            }
;

T:
    id      {
                $$ = $1;
            }
|   num     {
                $$ = $1;
            }
;

void MakeDOTFile(NODE*cell)
{
    fout << "\t" << cell->id << "\t\t[ style = solid label = \"" + cell->val + "\"  ];" << endl;
    for(auto &child:cell->list)
    {
        fout << "\t" << cell->id << " -> " << child->id << endl;
        MakeDOTFile(child);
    }
}

int main()
{
    ifstream infile("./DOT_Template.txt");
    string line;
    while (getline(infile, line))
        fout << line << endl;
    yyparse();
    MakeDOTFile(head);
    fout << "}";
    fout.close();
}