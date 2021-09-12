#!/bin/bash

apt-get update &&apt install iputils-ping net-tools -y

MEMORY=512
IMAGE=/root/hda.img
KERNEL=/root/vmlinuz-3.2.0-4-versatile
INITRD=/root/initrd.img-3.2.0-4-versatile
INNER_SSH_PORT=22
OUTER_SSH_PORT=5565

qemu-system-arm \
-M versatilepb \
-m $MEMORY \
-hda $IMAGE \
-kernel $KERNEL \
-initrd $INITRD \
-append 'root=/dev/sda1 console=ttyAMA0 nokaslr' \
-nographic \
-device i82550,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::$OUTER_SSH_PORT-:$INNER_SSH_PORT\
,hostfwd=tcp::22-:22\
,hostfwd=tcp::23-:23\
,hostfwd=tcp::69-:69\
,hostfwd=tcp::80-:80\
,hostfwd=tcp::322-:322\
,hostfwd=tcp::443-:443\
,hostfwd=tcp::554-:554\
,hostfwd=tcp::8000-:8000\
,hostfwd=tcp::9010-:9010\
,hostfwd=tcp::9020-:9020\
,hostfwd=tcp::23946-:23946
