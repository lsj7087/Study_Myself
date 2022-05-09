#include <stdio.h>
int main()
{
    int a,b,c;
    int ans=0;
    scanf("%d %d %d",&a,&b,&c);
    ans=(a+b)%c;
    printf("%d\n",ans);
    ans=((a%c)+(b%c))%c;
    printf("%d\n",ans);
    ans=(a*b)%c;
    printf("%d\n",ans);
    ans=((a%c)*(b%c))%c;
    printf("%d\n",ans);
    return 0;
}