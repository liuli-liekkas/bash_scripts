#!/bin/bash
#给脚本传递三个整数，判断其中的最大数和最小数，并显示出来。
max=$1
min=$1
for i in $*;do
	if [ $i -ge $max ];then
		max=$i
	fi
	if [ $i -le $min ];then
		min=$i
	fi
done
echo "max=$max"
echo "min=$min"	
