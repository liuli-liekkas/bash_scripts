#!/bin/bash
#写一个脚本，利用RANDOM生成10个随机数，并找出其中的最大值，和最小值；
#放弃
NUMBERS=`for A in $(seq 1 $1);do echo -n "$RANDOM ";done`
echo $NUMBERS
for I in `seq 1 $1`;do
        NUM=`echo $NUMBERS | cut -d' ' -f1`
        NEWNUMBERS=`echo $NUMBERS | cut -d' ' -f2-`
        for B in $NEWNUMBERS;do
            [ $B -ge $NUM ] && NUM=$B
        done
        echo -n "$NUM "
	echo $NUMBERS
	NUMBERS=`for I in $NUMBERS;do printf "$I\n";done`
	echo $NUMBERS
	NUMBERS=`echo $NUMBERS | grep -v $NUM`
	NUMBERS=`echo -n $NUMBERS`
done
