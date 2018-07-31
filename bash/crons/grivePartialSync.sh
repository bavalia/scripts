#! /bin/bash

#grive2 binary is in /usr/local/bin
#Path required for grive2
#PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/

LOGFILE='./.sync.log'

echo 'changing directory to /home/patel/gDrive'
cd /home/patel/gDrive

echo -e "$? : Drive Sync ATTEMPTED @ $(date) \u02e5" >> $LOGFILE

#grive single directory sync.
# wiki: http://yourcmc.ru/wiki/Grive2

# grive --force   #force to always download file instead of uploading
# grive --dry-run #Only detect which file is changed
# grive - s subdirectory #selective sync directory wise

echo 'syncing Projects and Scripts'
grive -s Projects

echo 'syncing Documents'
grive -s Documents

echo 'syncing linux_info'
grive -s linux_info

echo 'syncing Books'
grive -s Books

STATUS=$?
echo -e "$STATUS : Drive Sync COMPLETED @ $(date) \u02e9" >> $LOGFILE
if [ $STATUS -ne 0 ] ; then  touch "/home/patel/Desktop/grive_sync_error_$(date)" ; fi

cd -
echo "### Done @$(date) ###"

