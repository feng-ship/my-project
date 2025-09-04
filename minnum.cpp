#include<cstdio>
int main(){
    int n,m;scanf("%d%d",&n,&m);
    int ans=0;
    for(int i=1;i<=n;++i){
        int x;scanf("%d",&x);
        if(x<m)ans+=x;
    }
    printf("%d\n",ans);
    return 0;
}