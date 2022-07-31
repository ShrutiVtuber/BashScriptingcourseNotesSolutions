#!/bin/bash
#cat /etc/shadow
RESULT_OF_COMMAND=$(cat /etc/shadow)
RESULT=$?
if [ $RESULT -eq 0 ]
then
	echo "Command run successfully!"
else
	echo "Command run unsucessfully!"
fi
