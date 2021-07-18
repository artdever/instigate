#!/bin/bash

user=`whoami`
declare filePermissions=(- - -)
perms=`stat -L -c %A $1`
perm=( `echo "$perms" | fold -w1` )
access=""

#get user user permisions
if [ `stat -L -c %U $1` == $user ]; then
	access+=" USER,"
	if [ ${perm[1]} == "r" ]; then
		filePermissions[0]="r"
	fi
	if [ ${perm[2]} == "w" ]; then
		filePermissions[1]="w"
	fi
	if [ ${perm[3]} == "x" ]; then
		filePermissions[2]="x"
	fi
fi
#get user group permissions
if [ `stat -L -c %G $1` == $user ]; then
	access+=" GROUP"
	if [ ${perm[4]} == "r" ]; then
		filePermissions[0]="r"
	fi
	if [ ${perm[5]} == "w" ]; then
		filePermissions[1]="w"
	fi
	if [ ${perm[6]} == "x" ]; then
		filePermissions[2]="x"
	fi
fi
#get user other permissions
	if [ ${perm[7]} == "r" ]; then
		filePermissions[0]="r"
	fi
	if [ ${perm[8]} == "w" ]; then
		filePermissions[1]="w"
	fi
	if [ ${perm[9]} == "x" ]; then
		filePermissions[2]="x"
	fi

echo "$user have$access access and permissions are ${filePermissions[@]}"
