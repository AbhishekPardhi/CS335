#include<bits/stdc++.h>
using namespace std;

void A()
{
    string s;
    cin >> s;
    for(auto &c:s)
        cout << (c == '|' ? ' ' : c);
}

void B()
{
    int n;
    cin >> n;
    while(n--)
    {
        string x, y;
        cin >> x >> y;
        cout << "#define " << x << " " << y << endl;
    }
}

int main()
{
    B();
}
