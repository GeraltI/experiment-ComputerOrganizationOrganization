#include <stdio.h>

int main(void)
{
    long long int id;
    id = 18;
    printf("%LLd",cube(id));
}

int cube(int a)
{
    int x;
    long long int y,result;
    x = a;
    y = a;
    result = 0;
    for(int i = 0;i < 16;i++)
    {
        if(y % 2 == 1)
        {
            result += x;
        }
        x = x << 1;
        y = y >> 1;
    }
    x = result;
    y = a;
    result = 0;
    for(int i = 0;i < 32;i++)
    {
        if(y % 2 == 1)
        {
            result += x;
        }
        x = x << 1;
        y = y >> 1;
    }
    return result;
}
