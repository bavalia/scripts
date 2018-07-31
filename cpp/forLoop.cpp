// -*- compile-command: "g++ -std=c++11 forLoop.cpp && ./a.out" -*-
#include <iostream>
// Time functions
#include <chrono>
typedef std::chrono::high_resolution_clock::time_point timeVar;
#define timeNow() std::chrono::high_resolution_clock::now()
#define duration(a) std::chrono::duration_cast<std::chrono::nanoseconds>(a).count()
#define freq(a) 1000000000.0/duration(a)



using namespace std;
#define N 100000000
static int size(){
  // cout<< "in size" << endl;
  return N;
}

int main(){
  int j = 0;
  timeVar t1, t2;
  t1 = timeNow();
  for(int i=0, n=size(); i<size(); i++){
    j += 1;
    // std::cout<<j << " " << i << " " << n << std::endl;
  }
  t2 = timeNow();
  cout<< duration(t2-t1)<< " "<< duration(t2-t1)*1000/N;
  return 0;
}
