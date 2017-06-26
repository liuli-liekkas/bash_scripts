#!/bin/bash
#1、设定变量FILE的值为/etc/passwd
#2、依次向/etc/passwd中的每个用户问好，并显示对方的shell，形如：  
#	Hello, root, your shell: /bin/bash
#3、统计一共有多少个用户
#只向默认shell为bash的用户问声好
FILE=/etc/passwd
LINES=`wc -l $FILE | cut -d' ' -f1`
for I in `seq 1 $LINES`;do
	if [ `head -n $I $FILE | tail -1 | cut -d: -f7` == "/bin/bash" ];then
		echo "hello, `head -n $I $FILE | tail -1 | cut -d: -f1`, your shell:`head -n $I $FILE | tail -1 | cut -d: -f7`"
	fi
done
echo "there are $LINES users in total."

