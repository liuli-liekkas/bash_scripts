#!/bin/bash
#计算100以内所有能被3整除的正整数的和；
#取模，取余:%
#3%2=1
#100%55=45
declare -i SUM=0
for i in {1..100};do
	if [ $[$i%3] -eq 0 ];then
		SUM=$[$SUM+$i]	
	fi
done
echo $SUM
