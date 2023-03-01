#include<bits/stdc++.h>
using namespace std;

string Upper(string x)
{
    string ans="";
    for(auto c:x)
        ans.push_back(toupper(c));
    return ans;
}

void A()
{
    int n;
    int j = 0;
    cin >> n;
    string s;
    for (int i = 0; i < n;i++)
    {
        cin >> s;
        cout << "_" << Upper(s).substr(1, s.length() - 2) + "=" << i+j << ", ";
    }
}

void C()
{
    int n;
    int j = 77;
    cin >> n;
    string s;
    for (int i = 0; i < n;i++)
    {
        cin >> s;
        cout << "_" << s + "=" << i+j << ", ";
    }
}

void B()
{
    int n;
    cin >> n;
    string s;
    while(n--)
    {
        cin >> s;
        cout << "{" + s + ", _" + Upper(s).substr(1,s.length()-2) + "}, ";
    }
}

int main()
{
    // A();
    // B();
    C();
}

// 66
// "abstract" "continue" "for" "new" "switch" "assert" "default" "if" "package" "synchronized" "boolean" "do" "goto" "private" "this" "break" "double" "implements" "protected" "throw" "byte" "else" "import" "public" "throws" "case" "enum" "instanceof" "return" "transient" "catch" "extends" "int" "short" "try" "char" "final" "interface" "static" "void" "class" "finally" "long" "strictfp" "volatile" "const" "float" "native" "super" "while" "exports" "opens" "requires" "uses" "module" "permits" "sealed" "var" "non-sealed" "provides" "to" "with" "open" "record" "transitive" "yield"

