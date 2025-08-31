#include<cstdio>
int main(){
    int y,m;
    scanf("%d%d",&y,&m);
    bool p1;
    p1=((y%4==0&&y%100!=0)||y%400==0);
    if (p1==0){
        if (m==2)
            printf("28");
        else if(m==1||m==3||m==5||m==7||m==8||m==10||m==12)
            printf("31");
        else
            printf("30");
    }else{
        if (m==2)
            printf("29");
        else if(m==1||m==3||m==5||m==7||m==8||m==10||m==12)
            printf("31");
        else
            printf("30");
        
    }
    return 0;
}