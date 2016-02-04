#!/bin/bash
#This is a sample cloud-config-using rancheros PXE.  Thing is, I've had a tough time with the cloud-config, so that's left as an exercise to the user, here's the [example](http://docs.rancher.com/os/cloud-config/) page:
rm rancheros/initrd rancheros/vmlinuz
wget -O rancheros/initrd https://releases.rancher.com/os/latest/initrd
wget -O rancheros/vmlinuz https://releases.rancher.com/os/latest/vmlinuz
sudo pixiecore -kernel=rancheros/vmlinuz -initrd=rancheros/initrd -cmdline=rancher.cloud_init.datasources=[url:http://192.168.100.2:8080/cloud-config.yml]
