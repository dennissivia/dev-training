#include<stdio.h>


int main(){
  unsigned long long int i,n;
  int j,pp,rem;
  int m,a[4];
  int s[500000];
  scanf("%llu",&n);
  scanf("%d",&m);

  a[1]=1;
  a[2]=1;
  a[3]=2;

  //finding pissano period
  if(n==2)
    rem=2;
  else if(n==3)
    rem=8;
  else{
    for(i=0;i<=n+3;i++){
      if(i>3){
        // printf("%d %d %d \t",a[0],a[1],a[2]);
        a[0]=a[1];
        a[1]=a[2];
        a[2]=(a[0]+a[1])%m;
        // check if we just started a new cycle by checking if the start
        // of the fibonacci sequence re occured
        if(a[0]==0&&a[1]==1&&a[2]==1){
          pp=i-3;
          break;
        }
      }
    }
    rem=n%pp;
  }

  // simply calculate the fibonacci number of all N with N < the remainder
  // calculation is done by a ( mod m + b mod m ) mod m
  for(i=0;i<=rem;i++){
    s[0]=0;
    s[1]=1;
    if(i>=2)
      s[i]=((s[i-1])%m+(s[i-2])%m)%m;
  }
  printf("%d\t",s[rem]);
}

