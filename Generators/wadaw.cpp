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
    string x;
    cin >> n;
    while(n--)
    {
        cin >> x;
        cout << "case _" << Upper(x) << ":return " << Upper(x) << ";" << endl;
    }
}

void B()
{
    int n;
    cin >> n;
    while(n--)
    {
        string x, y;
        cin >> x >> y;
        cout << "{" << x << ", _" << y << "}, ";
    }
}

void C()
{
    int n;
    string x;
    cin >> n;
    while(n--)
    {
        cin >> x;
        cout << "case _" << x << ":return " << x << ";" << endl;
    }
}

int main()
{
    // int n;
    // string x;
    // cin >> n;
    // while(n--)
    // {
    //     cin >> x;
    //     cout << "case \"" << x << "\":return " << x << ";" << endl;
    // }
    // A();
    // B();
    C();
}


// "=" EQUALS
// ">" GT
// "<" LT
// "!" NOT
// "~" TILDE
// "?" QUESTION
// ":" COLON
// "==" EQUALS
// "<=" LE
// ">=" GE
// "!=" NOT_EQUALS
// "&&" AND
// "||" OR
// "++" PLUS_PLUS
// "--" MINUS_MINUS
// "+" PLUS
// "-" MINUS
// "*" TIMES
// "/" DIVIDE
// "^" XOR
// "%" MOD
// "<<" LEFT_SHIFT
// ">>" RIGHT_SHIFT
// ">>>" UNSIGNED_RIGHT_SHIFT
// "+=" PLUS_EQUALS
// "-=" MINUS_EQUALS
// "*=" TIMES_EQUALS
// "/=" DIVIDE_EQUALS
// "&=" AND_EQUALS
// "|=" OR_EQUALS
// "^=" XOR_EQUALS
// "%=" MOD_EQUALS
// "<<=" LEFT_SHIFT_EQUALS
// ">>=" RIGHT_SHIFT_EQUALS
// ">>>=" UNSIGNED_RIGHT_SHIFT_EQUALS

// EQUALS
// GT
// LT
// NOT
// TILDE
// QUESTION
// COLON
//  EQUALS
//  LE
//  GE
//  NOT_EQUALS
//  AND
//  OR
//  PLUS_PLUS
//  MINUS_MINUS
// PLUS
// MINUS
// TIMES
// DIVIDE
// XOR
// MOD
//  LEFT_SHIFT
//  RIGHT_SHIFT
//  UNSIGNED_RIGHT_SHIFT
//  PLUS_EQUALS
//  MINUS_EQUALS
//  TIMES_EQUALS
//  DIVIDE_EQUALS
//  AND_EQUALS
//  OR_EQUALS
//  XOR_EQUALS
//  MOD_EQUALS
//  LEFT_SHIFT_EQUALS
//  RIGHT_SHIFT_EQUALS
//  UNSIGNED_RIGHT_SHIFT_EQUALS