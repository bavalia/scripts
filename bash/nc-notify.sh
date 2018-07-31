#! /bin/bash

while [ 1=1 ]; do
echo "listening on 4444"
#notify-send "Title2" "`nc -l 4444 `"
#message=$(nc -l 4444 | sed -ne 's/^rate..\([0-9]*\)%.*/\1/p')
message=$(nc -l 4444 )
notify-send "NC message" "$message"
done

