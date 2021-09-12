#!/bin/bash

apt-get update &&apt install iputils-ping net-tools -y

MEMORY=512
IMAGE=/root/hda.img
KERNEL=/root/vmlinux-4.9.0-9-4kc-malta
INITRD=/root/initrd.img-4.9.0-9-4kc-malta
INNER_SSH_PORT=22
OUTER_SSH_PORT=5555

qemu-system-mipsel \
-M malta \
-m $MEMORY \
-hda $IMAGE \
-kernel $KERNEL \
-initrd $INITRD \
-append 'root=/dev/sda1 console=ttyS0 nokaslr' \
-nographic  \
-device e1000,netdev=net0 \
-netdev user,id=net0,hostfwd=tcp::$OUTER_SSH_PORT-:$INNER_SSH_PORT\
,hostfwd=tcp::22-:22\
,hostfwd=tcp::23-:23\
,hostfwd=tcp::69-:69\
,hostfwd=tcp::80-:80\
,hostfwd=tcp::443-:443\
,hostfwd=tcp::23946-:23946
