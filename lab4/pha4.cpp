#include<iostream> 
using namespace std;
int func4(int a1, int a2)
{
  int v3;
  if ( a1 <= 0 )
    return 0;
  if ( a1 == 1 )
    return a2;
  v3 = func4(a1 - 1, a2) + a2;
  return v3 + func4(a1 - 2, a2);
}
int main()
{
  for (int i=2; i<=4; i++)
  {
     cout <<func4(9,i) << " " << i <<endl;
  }
  return 0;
}