#!/bin/bash
#
DEBUG=0
ADD=0
DEL=0
for I in `seq 0 $#`;do
    if [ $# -gt 0 ];then
        case $1 in
            -v|--verbose)
	        DEBUG=1
	        shift
	        ;;
	    -h|--help)
	        echo "Usage:`basename $0` --add USER_LIST --del USER_LIST | -v|--verbose -h|--help"
	        exit 0
	        ;;
	    --add)
	        ADD=1
	        ADDUSER=$2
	        shift 2
	        ;;
	    --del)
	        DEL=1
	        DELUSER=$2
	        shift 2
	        ;;
	    *)
	        echo "Usage:`basename $0` --add USER_LIST --del USER_LIST | -v|--verbose -h|--help"
	        exit 6
        esac
    fi
done

if [ $ADD -eq 1 ];then
    for I in `echo $ADDUSER | sed 's/,/ /g'`;do
	if id $I &> /dev/null;then
	    [ $DEBUG -eq 1 ] && echo "user $I exists."
	else
	    useradd $I && echo $I | passwd --stdin $I &> /dev/null
	    [ $DEBUG -eq 1 ] && echo "user $I add successfully."
	fi
    done
fi

if [ $DEL -eq 1 ];then
    for I in `echo $DELUSER | sed 's/,/ /g'`;do
	if ! id $I &> /dev/null;then
	    [ $DEBUG -eq 1 ] && echo "user $I does not exists."
	else
	    userdel -r $I &> /dev/null
	    [ $DEBUG -eq 1 ] && echo "user $I del successfully."
	fi
    done
fi




