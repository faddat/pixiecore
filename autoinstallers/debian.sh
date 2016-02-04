#!/bin/bash
#This script will delete any existing initrd/kernel for debian in /examples/debian and then download today's latest & greatest initrd & debian.  Lastly, it will use a minimal debian preseed to autoinstall on as many hosts as you feel like rebooting.
mkdir debian
rm debian/linux
rm debian/initrd.gz
wget -O debian/linux http://ftp.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux
wget -O debian/initrd.gz http://ftp.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz
sudo pixiecore -initrd debian/initrd.gz -kernel debian/linux -cmdline="auto=true locale=en_US keyboard-configuration/xkb-keymap=us hw-detect/load_firmware=false netcfg/choose_interface=auto hostname=debian domain=klouds.org url=http://212.47.243.130:2015/preseed.cfg"
