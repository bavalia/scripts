#! /bin/bash

# give full address
LOGFILE="${BASH_SOURCE[0]}.log"
WorkDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "CRON at_reboot ATTEMPTED @ $(date) \u02e5" >> $LOGFILE
sleep 2m

Dir='/home/swaayatt/Documents/DataSets/DataForSelfDrivingCar/PedestrianDetection/Daimler/cyclistDetection'
Urls="${WorkDir}/cyclist.txt"
bash ${WorkDir}/wgetRecursive.sh -nv -P $Dir -i $Urls &
echo -e "CRON Download ATTEMPTED @ $(date) \n$Urls @ $Dir" |tee -a $LOGFILE

echo -e "CRON at_reboot COMPLETED @ $(date) \u02e9"  >> $LOGFILE
echo "### CRON Done @$(date) ###"

