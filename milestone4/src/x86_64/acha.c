#include<stdio.h>
#include <stdbool.h>

int main()
{
    bool x=true;
    if(x)
        x=false;
    else
        x=true;
    printf("%d\n",x);
    return 0;
}