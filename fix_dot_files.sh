#!/bin/bash

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
