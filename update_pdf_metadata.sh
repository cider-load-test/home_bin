#!/bin/bash

#this script is to update the metadata on pdf's using pdftk and pdfopt

read -ep "enter pdf filename: " PDFNAME # -e use realine -p prompt

pdfinfo $PDFNAME

# the following loops yes/no untill a correct answer is given
((NOT_VALID = 1))
while [[ $NOT_VALID = 1 ]]
do
	read -ep "do you wish to update the info in this file? [y/n]: " YESNO
	if [[ $YESNO = "y" || $YESNO = "n" ]]
	then
		((NOT_VALID = 0))
		continue
	else
		echo '"'$YESNO'"' "is not valid"
	fi
done
if [[ $YESNO = "n" ]]
then
	exit
fi

# remove underscores and file extension for the title metadata
echo $PDFNAME | sed s/_/\ /g | sed s/.pdf//g $PDFTITLE
echo $PDFTITLE

pdftk $PDFNAME update_info update_meta.txt output tmp.pdf
