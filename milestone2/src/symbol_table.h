#include<vector>
using namespace std;
typedef struct symbol_table{
    vector<char*> token;
    vector<char*> lexeme;
    vector<char*> type;
    vector<int> line_num;
    struct symbol_table* prev;
} st ;

typedef struct st_list{
    string label;
    st* node;
    struct st_list* prev;
} stl ;