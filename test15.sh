#!/bin/bash
#写一个脚本showlogged.sh，其用法格式为：
#showlogged.sh -v -c -h|--help
#其中，-h选项只能单独使用，用于显示帮助信息；-c选项时，显示当前系统上登录的所有用户数；如果同时使用了-v选项，则既显示同时登录的用户数，又显示登录的用户的相关信息；如
#Logged users: 4. 
#
#They are:
#root     tty2         Feb 18 02:41
#root     pts/1        Mar  8 08:36 (172.16.100.177)
#root     pts/5        Mar  8 07:56 (172.16.100.177)
#hadoop   pts/6        Mar  8 09:16 (172.16.100.177)
for I in `seq 0 $#`;do
    if [ $# -gt 0 ];then
	case $1 in
	    -h)
		echo "Usage:`basename $0` -h | -c [-v]"
		exit 0
		;;
	    -c)
	    	echo "Logged users:`who | wc -l`."
		shift
		;;
	    -v)
		echo -e "they are:"
		who
		shift
		;;
	    *)
		echo "Usage:`basename $0` -h | -c [-v]"
		exit 6
		;;
	esac
    fi
done
