#!/bin/bash

apt-get update &&apt install iputils-ping net-tools -y


MEMORY=512
IMAGE=/root/debian_wheezy_armhf_standard.qcow2
KERNEL=/root/vmlinuz-3.2.0-4-vexpress
INITRD=/root/initrd.img-3.2.0-4-vexpress
INNER_SSH_PORT=22
OUTER_SSH_PORT=5575

qemu-system-arm \
-M vexpress-a9 \
-m $MEMORY \
-kernel $KERNEL \
-initrd $INITRD \
-drive if=sd,file=$IMAGE \
-append "root=/dev/mmcblk0p2 console=ttyAMA0 nokaslr" \
-nographic \
-redir tcp:$OUTER_SSH_PORT::$INNER_SSH_PORT \
-redir tcp:22::22 \
-redir tcp:23::23 \
-redir tcp:69::69 \
-redir tcp:80::80 \
-redir tcp:322::322 \
-redir tcp:443::443 \
-redir tcp:554::554 \
-redir tcp:8000::8000 \
-redir tcp:9010::9010 \
-redir tcp:9020::9020 \
-redir tcp:23946::23946