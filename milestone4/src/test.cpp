#include<stdio.h>

int sum(int a, int b, int c, int d, int e, int f, int g)
{
    return a+b;
}

int main()
{
    char c='a';
    int i=0;
    int j=5;
    long k=sum(i,j,0,0,0,0,0);
    printf("%lld\n",k);

    return 0;
}