#! /bin/bash
no1=0
echo $1
while [ $no1 -lt 10 ]; do
    echo -en "$no1"
    number=$((no1 + 1))
done
