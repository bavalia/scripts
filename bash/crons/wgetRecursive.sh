#! /bin/bash

#Ho#WorkDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#Script=$( basename "${BASH_SOURCE[0]}" )
LOGFILE="${BASH_SOURCE[0]}.log"

echo -e "Download ATTEMPTED @ $(date) \u02e5 \n$@" |tee -a $LOGFILE

#while getopts ":P:" opt; do
  #case $opt in
    #P)
      #DownloadDir=$OPTARG
      #if [ ! -d "$DownloadDir" ]; then
        #echo -e "Download COMPLETED @ $(date) \u02e9 : error \n#Output Directory Does not exist \"$DownloadDir\" " |tee -a $LOGFILE
        #exit 1
      #fi
      #;;
    #\?)
      #echo $@ >&2
      ## unknown argument
      #;;
    #:)
      ## error handling routine
      #;;
  #esac
#done
#exit

### S3 bucket folder could not be downloaded with wget, so manual link for each file above  
#wget -c -P $Dir -D $Domains -r -np -nH -R index.html* --cut-dirs=4 -i input.file \
  #http://www.vision.caltech.edu/Image_Datasets/CaltechPedestrians/datasets/USA/

wget -c $@ &>> $LOGFILE

STATUS=$?

if [ $STATUS -eq 0 ]; then 
  echo "### Downloaded ###"
elif [ $STATUS -eq 3 ]; then 
  echo -e "#Output Directory Does not exist " |tee -a $LOGFILE
else  
  echo "restarting the script after 15 min, $@"
  sleep 15m
  bash ${BASH_SOURCE[0]} $@ & 
fi

echo -e "Download COMPLETED @ $(date) \u02e9 : $STATUS \n$@" |tee -a $LOGFILE

