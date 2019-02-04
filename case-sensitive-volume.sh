#!/bin/bash

echo 'Mount Point / Directory Name'
echo "/Volumes/Macintosh\ HD/Users/${USER}/{directory_name}"
read -p '{directory_name}: ' directory_name
if [ ! ${directory_name} ]; then
    echo "Please provide apfs drive volume name."
    exit;
fi

echo "Please provide apfs drive volume size (ex. 10G)."
read -p '{volume_size}: ' volume_size
if [ ! ${volume_size} ]; then
    echo "Invalid volume size."
    exit;
fi

echo "Please provide apfs drive container size (ex. disk1)."
read -p '{drive_container}: ' drive_container
if [ ! ${drive_container} ]; then
    echo "Invalid drive container."
    exit;
fi

NEW_DIR="/Volumes/Macintosh\ HD/Users/${USER}/${directory_name}"
if [ ! -d ${NEW_DIR} ]; then
    mkdir ${NEW_DIR}
fi
# make code sensitive mounted apfs volume
# diskutil … https://eclecticlight.co/2017/04/08/how-to-make-your-own-apfs-volume/
# mount point …. https://apple.stackexchange.com/questions/309861/mount-apfs-volume-to-users-with-the-disk-utility-during-the-installation
sudo diskutil apfs addVolume ${drive_container} "Case-sensitive APFS" ${directory_name} -reserve ${volume_size} -mountpoint ${NEW_DIR}
# go into that mount
cd /Users/${USER}
sudo chown ${USER} :staff ${directory_name}
cd ${directory_name}
