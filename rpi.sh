#!/bin/bash
downloads="/home/yairi/Downloads"
# base="$downloads/2019-07-10-raspbian-buster-full"
# base="$downloads/2019-07-10-raspbian-buster-lite"
# base="$downloads/musicbox_v0.7.0RC7"
# base="$downloads/OSMC_TGT_rbp2_20190808"
base="$downloads/pimusicbox-0.6.0/musicbox0.6"
zip="$base.zip"
img="$base.img"
# unzip $zip -d /home/yairi/Downloads
echo -n "Burning "
echo "$img"

# sha256sum /home/yairi/Downloads/2019-07-10-raspbian-buster-full.zip
# echo "2bd0613ec8739b6fa4274ea186ec859046f79e6aee4b8c6af0acb6d88f3f533a"




##############################################################################################
## From https://www.raspberrypi.org/documentation/installation/installing-images/linux.md ####
# lsblk
# umount /dev/mmcblk0p1
# umount /dev/mmcblk0p2

## Copy to SD card, back, truncate, compare, remove temporary file, sync, print.
dd bs=4M if=$img of=/dev/mmcblk0 status=progress conv=fsync ## copy - the important line
# dd bs=4M if=/dev/mmcblk0 of=from-sd-card.img count=1534 ## back
# truncate --reference $img from-sd-card.img ## truncate
# diff -s from-sd-card.img $img ## compare
# rm from-sd-card.img ## remove
sync
echo "Finished copying to SD card"
##############################################################################################




# ##############################################################################################
# ## From https://www.raspberrypi.org/documentation/configuration/wireless/headless.md #########
# ## Setup WiFi
# mkdir /media/yairi/boot
# mount /dev/mmcblk0p1 /media/yairi/boot
# mkdir /media/yairi/rootfs
# mount /dev/mmcblk0p2 /media/yairi/rootfs
# # rm /media/yairi/boot/wpa_supplicant.conf
# touch /media/yairi/boot/wpa_supplicant.conf
# echo 'country=il
# update_config=1
# ctrl_interface=/var/run/wpa_supplicant

# network={
#  ssid="yair"
#  psk="yairdidi"
# }
# ' >>  /media/yairi/boot/wpa_supplicant.conf
# echo "WiFi configured"


# # ## Enable SSH
# touch /media/yairi/boot/ssh
# sync
# echo "SSH enabled"

## Create your keys and give pi your public one, following https://www.debian.org/devel/passwordlessssh
# FILE=/home/yairi/.ssh/id_rsa.pub
# if test -f "$FILE"; then
#     echo "$FILE exist"
# else
#     echo "$FILE does not exist. Generate it!"
#     sudo -u yairi ssh-keygen
# fi

# rm -rvf /media/yairi/rootfs/home/pi/.ssh
# mkdir /media/yairi/rootfs/home/pi/.ssh
# cp /home/yairi/.ssh/id_rsa.pub /media/yairi/rootfs/home/pi/.ssh/authorized_keys
# chmod 600 /media/yairi/rootfs/home/pi/.ssh/
# sync

# rm /home/yairi/.ssh/config
# touch /home/yairi/.ssh/config
# echo "Host rasp
#     HostName 192.168.1.2
#     User pi
#     IdentityFile ~/.ssh/id_rsa
# " >> /home/yairi/.ssh/config

echo "Done"
