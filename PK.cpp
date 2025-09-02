#include<iostream>
#include<algorithm>
int main(){
    int x1,y1,x2,y2;
    scanf("%d%d%d%d",&x1,&y1,&x2,&y2);
    int a=x1*pow(10,y1);
    int b=x2*pow(10,y2);
    if (std::abort(a,b)==b)
        printf("<");
        else if (max(a,b)==a)
        printf(">");
        else
        printf("=");
    return 0;
}