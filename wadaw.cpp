#include<bits/stdc++.h>
using namespace std;

string Upper(string x)
{
    string ans="";
    for(auto c:x)
        ans.push_back(toupper(c));
    return ans;
}

int main()
{
    int n;
    string x;
    cin >> n;
    while(n--)
    {
        cin >> x;
        cout << "case \"" << x << "\":return " << x << ";" << endl;
    }
}