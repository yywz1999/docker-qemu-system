# docker-qemu-system
qemu-system by docker-compose

based:
waveburst/qemu-system-armhf                                                                                              
waveburst/qemu-system-mipsel                                             A full QEMU system emulation for Debian MIPS…   
waveburst/qemu-system-armel                                                                                              
waveburst/qemu-system-mips                                               A full QEMU system emulation for Debian MIPS…   




## - HELP

- open port : 22,23,80,443,69,23946


## - USAGE:

- docker-compose up -d
- chmod +x start.sh
- docker cp start.sh xxx:/root/start.sh
- docker restart xxx
- docker exec -it xxx bash
- apt-get update &&apt install iputils-ping net-tools -y
- ssh default user/pass :
  - mipsel/mipsel
  - mips/mips
  - armel/armel
  - armhf/armhf
