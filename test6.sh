#!/bin/bash
#计算1+..+100
declare -i SUM=0
for i in {1..100};do
	SUM=$[ $SUM + $i ]
done
echo $SUM
