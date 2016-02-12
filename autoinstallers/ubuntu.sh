#!/bin/bash
#This script will delete any existing initrd/kernel for ubuntu in /autoinstallers/ubuntu and then download today's latest & greatest initrd & ubuntu.  Lastly, it will use a minimal Ubuntu preseed to autoinstall on as many hosts as you feel like rebooting.
mkdir ubuntu
rm ubuntu/initrd.gz
rm ubuntu/linux
wget -O ubuntu/initrd.gz http://opensource.xtdv.net/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz
wget -O ubuntu/linux http://opensource.xtdv.net/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux
sh httpsupplements/servethese.sh
sudo pixiecore -kernel=ubuntu/linux -initrd=ubuntu/initrd.gz -cmdline="auto=true locale=en_US keyboard-configuration/xkb-keymap=us hw-detect/load_firmware=false netcfg/choose_interface=auto hostname=debian domain=klouds.org url=http://192.168.100.2:8080/ubuntupreseed.cfg"

