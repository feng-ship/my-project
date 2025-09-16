#include<iostream>
using namespace std;
int main(){
    int score[110],i=0;
    while(true){
        cin >> score[i];
        if (score[i]==0) break;
        i++;
    }
    for (int j=i-1;j>=0;j--)
        cout << score[j] << " ";
    return 0;
}