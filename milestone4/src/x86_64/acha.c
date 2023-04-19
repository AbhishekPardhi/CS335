#include<stdio.h>
#include <stdbool.h>

int nope(){
    return 0;
}

int haha(){
    nope();
    return 0;
}

int func (int a, int b, int c, int d, int e){
    haha();
    int a1=2;
    int a2=4;
    int a3=2;
    int a4=4;
    int a5=2;
    int a6=4;
    a1=a2+a3+a4+a5+a6;
    return c;
}

int main()
{
    int a1=2;
    int a2=4;
    int a3=2;
    int a4=2;
    int a5=3;
    func(a1,a2,a3,a4,a5);
    a1=2;
}