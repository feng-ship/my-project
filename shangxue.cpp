#include<cstdio>
#include<cmath>
int main(){
    int s,v;
    scanf("%d%d",&s,&v);
    int need=ceil(s/v)+10;
    int arrive=8*60;
    int leave=(arrive-need+24*60)%(24*60);
    printf("%02d:%02d\n",leave/60,leave%60);
    return 0;

}