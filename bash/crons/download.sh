#! /bin/bash
#use: bash download.sh url DownloadDir
#use: bash download.sh '-i urlList' DownloadDir

Home='/home/swaayatt'
if [ ! -z $HOME ]; then
  Home=$HOME
fi

Urls="-i url.txt"
if [ ! -z $1 ]; then
  Urls=$1
fi

DownloadDir=${Home}/Downloads
if [ ! -z $2 ]; then
  DownloadDir=$2
fi

#WorkDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#Script=$( basename "${BASH_SOURCE[0]}" )
LOGFILE="${BASH_SOURCE[0]}.log"

echo "To download $@"

echo -e "Download ATTEMPTED @ $(date) \u02e5 \n$@" |tee -a $LOGFILE
if [ ! -d "$DownloadDir" ]; then
  echo -e "Download COMPLETED @ $(date) \u02e9 : error \n#Output Directory Does not exist \"$DownloadDir\" " |tee -a $LOGFILE
  exit
fi

echo "Downloading files ... "
### S3 bucket folder could not be downloaded with wget, so manual link for each file above  
#wget -c -P $Dir -D $Domains -r -np -nH -R index.html* --cut-dirs=4 -i input.file \
  #http://www.vision.caltech.edu/Image_Datasets/CaltechPedestrians/datasets/USA/

wget -c $@

STATUS=$?
echo -e "Download COMPLETED @ $(date) \u02e9 : $STATUS \n$@" |tee -a $LOGFILE

if [ $STATUS -eq 0 ] 
then  
  echo "### Downloaded ###"
else
  echo "restarting the script after 15 min"
  bash -c "sleep 15m ; bash ${BASH_SOURCE[0]} $@" & 
fi

echo "### Done $@ $(date) ###"

