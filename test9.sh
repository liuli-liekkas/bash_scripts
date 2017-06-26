#!/bin/bash
#写一个脚本，分别显示当前系统上所有默认shell为bash的用户和默认shell为/sbin/nologin的用户，并统计各类shell下的用户总数。显示结果形如：
#BASH，3users，they are:
#root,redhat,gentoo
#
#NOLOGIN, 2users, they are:
#bin,ftp
BASHUSER=`cat /etc/passwd | grep /bin/bash | cut -d: -f1`
BASHUSERS=`echo $BASHUSER | sed 's/[[:space:]]/,/g'`
BASHNUMBER=`cat /etc/passwd | grep /bin/bash | wc -l`
echo "BASH,$BASHNUMBER users,they are:$BASHUSERS"

NOLOGINUSER=`cat /etc/passwd | grep /sbin/nologin | cut -d: -f1`	
NOLOGINUSERS=`echo $NOLOGINUSER | sed 's/[[:space:]]/,/g'`
NOLOGINNUMBER=`cat /etc/passwd | grep /sbin/nologin | wc -l`
echo "NOLOGIN,$NOLOGINNUMBER users,they are:$NOLOGINUSERS"
