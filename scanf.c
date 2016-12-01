//scanf在接受整数输入时需要使用&,原因未知


#include <stdio.h>

int main()
{
    int num = 0;
    scanf("%d", &num);
    return 0;
}
