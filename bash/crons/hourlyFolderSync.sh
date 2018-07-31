#! /bin/bash

# Folders to sync hourly

#TODO:
#1 shift to osync or unison, for bi-directional syncing

# rsync -avz --delete Source/ Destination/
      # -a preserve file attribute
      # -v verbose
      # -z compress
      # --delete : delete files in Destination which are not in Source
      # do not forget "/" after source
      # --info=progress2 : display progress and speed of current transfer
      
# rsync -av --info=progress2 "source" "Destination/"


echo "Syncing Folders...."

# Add all folders to sync hourly ...

# Swaayatt SLAM
rsync -av ~/knowledge/swaayatt/code/kunal/SLAM_sync/  ~/knowledge/swaayatt/code/kunal/backup/SLAM/
rsync -av ~/knowledge/swaayatt/code/kunal/dataProcess_sync/ ~/knowledge/swaayatt/code/kunal/backup/dataProcess/

# Orgfiles from dropbox to google drive
rsync -av ~/Dropbox/orgFiles ~/gDrive/Documents/



#STATUS=$?
#echo -e "$STATUS : Drive Sync COMPLETED @ $(date) \u02e9" >> $LOGFILE
#if [ $STATUS -ne 0 ] ; then  touch "/home/patel/Desktop/grive_sync_error_$(date)" ; fi

echo "### Done Syncing Folders @$(date) ###"
