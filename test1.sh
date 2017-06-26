#!/bin/bash
#传递三个参数给脚本，第一个为整数，第二个为算术运算符，第三个为整数，将计算结果显示出来，要求保留两位精度。形如：./calc.#sh 5 / 2
if [ $# -ne 3 ];then
	echo "Usage: ./test1.sh number1 [+-*/] number2."
	exit 6
fi

result=`echo "scale=2;$1$2$3" | bc`
echo "$1 $2 $3 = $result"
