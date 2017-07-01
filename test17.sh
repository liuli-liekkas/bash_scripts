#!/bin/bash
#写一个脚本(前提：请为虚拟机新增一块硬盘，假设它为/dev/sdb)，为指定的硬盘创建分区：
#1、列出当前系统上所有的磁盘，让用户选择，如果选择quit则退出脚本；如果用户选择错误，就让用户重新选择；
#2、当用户选择后，提醒用户确认接下来的操作可能会损坏数据，并请用户确认；如果用户选择y就继续，n就退出；否则，让用户重新选择；
#3、抹除那块硬盘上的所有分区(提示，抹除所有分区后执行sync命令，并让脚本睡眠3秒钟后再分区)；并为其创建三个主分区，第一个为20M，第二个为512M, 第三个为128M，且第三个为swap分区类型；(提示：将分区命令通过echo传送给fdisk即可实现)
echo "Intial a disk..."
echo -e "\033[31mWarning:\033[0m "
fdisk -l 2> /dev/null | grep -o "^Disk /dev/[sh]d[a-z]"

read -p "Your choice: " PARTDISK

if [ $PARTDISK == "quit" ];then
    echo "quit"
    exit 6
fi

until fdisk -l 2> /dev/null | grep -o "^Disk /dev/[sh]d[a-z]"| grep $PARTDISK &> /dev/null;do
    if [ $PARTDISK == "quit" ];then
    	echo "quit"
     	exit 7
    fi
    read -p "Wrong options.Your new choice: " PARTDISK
done

read -p "Will destroy all date,continue(y|n): " CHOICE

until [ $CHOICE == "y" -o $CHOICE == "n" ];do
    read -p "Will destroy all date,continue(y|n): " CHOICE
done

if [ $CHOICE == "n" ];then
    echo "quit"
    exit 8
else
    for I in `mount | grep "^/dev/sdb" | awk '{print $1}'`;do
	fuser -km $I &> /dev/null && umount $I &> /dev/null && echo "$I unmount successfully."
    done
    dd if=/dev/zero of=$PARTDISK bs=512 count=1 &> /dev/null
    sync
    sleep 3
    echo 'n
p
1

+20M
n
p
2

+512M
n
p
3

+128M
t
3
82
w' | fdisk $PARTDISK &> /dev/null 
    partprobe $PARTDISK &> /dev/null
    sync
    sleep 3
    mke2fs -j ${PARTDISK}1 && echo "${PARTDISK}1 made successfully."
    mke2fs -j ${PARTDISK}2 && echo "${PARTDISK}2 made successfully."
    mkswap ${PARTDISK}3 && echo "${PARTDISK}3 made successfully."
fi

