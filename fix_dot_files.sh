#!/bin/bash

# this script is to create or fix symlinks in the home directory to .etc
# and it is no where near completion

# backup dir just in case
test -d ~/.bak || mkdir ~/.bak

# bash files
FILES=(bashrc alias)
if [ ! -L ~/.$FILE ]; then
	if [ ! -e ~/.$FILE ]; then
		ln -s ~/.etc/$FILE ~/.$FILE
	elif [ -f ~/.$FILE ]; then
		mv ~/.$FILE ~/.bak/ && ln -s ~/.etc/$FILE ~/.$FILE
	else
		echo "error $FILE is a borked"
	fi
fi
