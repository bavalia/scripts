#! /bin/bash
filename=$( basename -- "${BASH_SOURCE[0]}" )
# extension="${filename##*.}"
fileRoot="${filename%.*}"


# compile and run
g++ --std=c++14 -O3 \
    ${fileRoot}.cpp \
    `pkg-config --cflags --libs opencv` \
    -o a.out \
    && ./a.out

#    -o ${fileRoot} \
#    && ./${fileRoot}
