#!/bin/bash
#1、添加10个用户user1到user10，密码同用户名；但要求只有用户不存在的情况下才能添加；
#
#扩展：
#接受一个参数：
#add: 添加用户user1..user10
#del: 删除用户user1..user10
#其它：退出
#adminusers user1,user2,user3,hello,hi
if [ $# -lt 1 ];then
    echo "Usage: ./test7.sh ARG"
    exit 7
fi
if [ $1 == "add" ];then
	for i in {1..10};do
		if ! id user$i &> /dev/null;then
			useradd user$i
			echo "user$i" | passwd --stdin user$i &> /dev/null
		fi
	done
elif [ $1 == "del" ];then
	for j in {1..10};do
		if id user$j &> /dev/null;then
			userdel -r user$j
		fi
	done
else
	echo "no parameter"
	exit 6	
fi
