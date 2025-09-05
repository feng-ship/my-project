#include<cstdio>
using namespace std;
int main(){
    int n;
    scanf("%d",&n);
    long long sum=0;
    for(int i=1;i<=n;i++){
        long long t=1;
        t*=i;
       long long sum+=t;
    }printf("%lld",sum);
    return 0;
}