#!/bin/bash

user=`whoami`
declare filePermissions=(- - -)
perms=`stat -L -c %A $1`
perm=( `echo "$perms" | fold -w1` )
access=""

`touch report.log`

#get user user permisions
if [ `stat -L -c %U $1` == $user ]; then
	access="USER"
	if [ ${perm[1]} == "r" ]; then
		filePermissions[0]="r"
		./createLog.sh $1
	fi
	if [ ${perm[2]} == "w" ]; then
		filePermissions[1]="w"
		./addDate.sh $1
	fi
	if [ ${perm[3]} == "x" ]; then
		filePermissions[2]="x"
#		./$1
	fi
#get user group permissions
elif [ `stat -L -c %G $1` == $user ]; then
	access="GROUP"
	if [ ${perm[4]} == "r" ]; then
		if [ filePermissions[0] == "-" ]; then
			filePermissions[0]="r"
			./createLog.sh $1
		fi
	fi
	if [ ${perm[5]} == "w" ]; then
		filePermissions[1]="w"
		./addDate.sh $1
	fi
	if [ ${perm[6]} == "x" ]; then
		filePermissions[2]="x"
#		./$1
	fi
#get user other permissions
else
	access="OTHER"
	if [ ${perm[7]} == "r" ]; then
		filePermissions[0]="r"
		if [ filePermissions[0] != "r" ]; then
			filePermissions[0]="r"
			./createLog.sh $1
		fi
	fi
	if [ ${perm[8]} == "w" ]; then
		filePermissions[1]="w"
		./addDate.sh $1
	fi
	if [ ${perm[9]} == "x" ]; then
		filePermissions[2]="x"
#		./$1
	fi
fi
echo "$user have $access access and permissions are ${filePermissions[@]}"
