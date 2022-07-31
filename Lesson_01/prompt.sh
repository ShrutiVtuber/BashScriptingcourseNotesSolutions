#!/bin/bash
#read -p "What file would you like to check:" PROMPT
PROMPT=$@
for PARAM in $PROMPT
do
if [ -f $PARAM ]
then
	echo "$PARAM is a regular file"
	(ls -l $PARAM)
elif [ -d $PARAM ]
then
	echo "$PARAM is a directory"
	(ls -l $PARAM)
else
	echo "$PARAM is neither a file or directory or it does not exist"
fi
done
