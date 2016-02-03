#!/bin/bash
#This script will delete any existing initrd/kernel for debian in /examples/debian and then download today's latest & greatest initrd & debian.  Lastly, it will use a minimal debian preseed to autoinstall on as many hosts as you feel like rebooting.
mkdir debian
rm debian/linux
rm debian/initrd.gz
wget -O debian/linux http://ftp.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/linux
wget -O debian/initrd.gz http://ftp.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/debian-installer/amd64/initrd.gz
sudo pixiecore -initrd debian/initrd.gz -kernel debian/linux -cmdline="auto=true url=http://gist.githubusercontent.com/faddat/6c04d3058aa1c7b524e2/raw/b342f379fcfc0827a515cdd08a6f8f042bb0c9b5/example-preseed.txt"
