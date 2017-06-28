#!/bin/bash
#写一个脚本，显示当前系统上shell为-s指定类型的用户，并统计其用户总数。-s选项后面跟的参数必须是/etc/shells文件中存在的shell类型，否则不执行此脚本。另外，此脚本还可以接受--help选项，以显示帮助信息。脚本执行形如：
#./showshells.sh -s bash
#显示结果形如：
#BASH，3users，they are:
#root,redhat,gentoo
if [ $1 == "-s" ];then
    ! grep $2 /etc/shells &> /dev/null && echo "Invalid shell." && exit 6
elif [ $1 == "--help" ];then
    echo "Usage:`basename $0` -s SHELL | --help"
    exit 7
else
    echo echo "Unknown Options."
    exit 8
fi

NUMOFUSER=`grep $2 /etc/passwd | wc -l`
NAMEOFUSERS=`grep $2 /etc/passwd | cut -d: -f1`
SHELLUSERS=`echo $NAMEOFUSERS | sed s/[[:space:]]/,/g`

echo -e "$2, $NUMOFUSER users,they are:\n$SHELLUSERS."

