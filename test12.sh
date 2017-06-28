#!/bin/bash
#计算100以内的奇数和偶数，并分别显示他们的和
declare -i EVENSUM=0
declare -i ODDSUM=0
for I in {1..100};do
    let M=$[$I%2]
    if [ $M -eq 0 ];then
	let EVENSUM+=$I
    else
	let ODDSUM+=$I
    fi
done

echo "EVENSUM is $EVENSUM"
echo "ODDSUM is $ODDSUM"
