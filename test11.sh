#!/bin/bash
if [ $# -lt 1 ];then
    echo "Usage: ./test11.sh ARG1 ARG2"
    exit 6
fi

if [ $1 == "--add" ];then
    for I in `echo $2 | sed 's/,/ /g'`;do
	if ! id $I &> /dev/null;then
	    useradd $I
	    echo $I | passwd --stdin $I &> /dev/null
	    echo "user $I add successfully."
	else
	    echo "user $I exists."
	fi
    done
elif [ $1 == "--del" ];then
    for I in `echo $2 | sed 's/,/ /g'`;do
	if id $I &> /dev/null;then
	    userdel -r $I
	    echo "user $I delete successfully."
	else
	    echo "user $I does not exists."
	fi
    done
 
elif [ $1 == "--help" ];then
    echo "Usage:./test11.sh --add USER1,USER2,... | --del USER1,USER2,... | --help"
else
    echo "WRONG ARG."
    exit 6
fi
