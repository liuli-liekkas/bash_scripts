#!/bin/bash
#传递3个参数给脚本，参数均为用户名。将此些用户的帐号信息提取出来后放置于/tmp/testusers.txt文件中，并要求每一行行首有行号。
if [ $# -ne 3 ];then
	echo "Usage: ./test2.sh user1 user2 user3."
	exit 6
fi

	echo "1 `id $1`" >> /tmp/testusers.txt
	echo "2 `id $2`" >> /tmp/testusers.txt
	echo "3 `id $3`" >> /tmp/testusers.txt
