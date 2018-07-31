#! /bin/bash

echo $1
if [ $1 = "" ] 
then 
  echo "Usage: ./compileNrun.sh filename.cpp"

else
  echo "g++ -std=c++11 $1 RazorAHRS.cpp -Wall -D_REENTRANT -lpthread -o a.out && ./a.out"

  # compile and run
  g++ -std=c++11 \
      $1 RazorAHRS.cpp \
      -Wall -D_REENTRANT -lpthread \
      -o a.out \
      && ./a.out

fi
