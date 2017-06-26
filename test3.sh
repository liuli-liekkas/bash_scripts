#!/bin/bash
#写一个脚本：
#判断当前主机的CPU生产商，其信息在/proc/cpuinfo文件中vendor id一行中。
#如果其生产商为AuthenticAMD，就显示其为AMD公司；
#如果其生产商为GenuineIntel，就显示其为Intel公司；
#否则，就说其为非主流公司；
cpu=`cat /proc/cpuinfo | grep vendor_id | sed 's/[[:space:]]//g' | cut -d: -f2`
if [ $cpu == "GenuineIntel" ];then
	echo "Intel公司"
elif [ $cpu == "AuthenticAMD" ];then
	echo "AMD公司"
else
	echo "非主流公司"
fi
