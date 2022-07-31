#!/bin/bash
SERVER_NAME=$(hostname)
SENTENCE="This script is running on ${SERVER_NAME}."
echo $SENTENCE


echo "========"
if [ -a /etc/shadow ]
then
	echo "Shadow passwords are enabled"
fi
if [ -w /etc/shadow ]
then
	echo "You have permissions to edit /etc/shadow"
else
	echo "You do NOT have permissions to edit /etc/shadow"
fi
