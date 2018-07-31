// -*- compile-command: "g++ arg.cpp ; chmod 755 ./a.out ; ./a.out" -*-

#include<iostream>
#include <stdio.h>

using namespace std;

int main(int argc, char **argv)
{
  cout<<argc << endl;
  for(int i=0; i<argc; ++i)
    {
      cout<<i << " "<<argv[i]<<endl;
    }
  return 0;
}
