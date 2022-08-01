#!/bin/bash
LINE_NUMBER=1
read -p "How many lines would you like: " NUMBER_OF_LINES
while [ "${LINE_NUMBER}" -le "${NUMBER_OF_LINES}" ]
do
	read LINE
	echo "${LINE_NUMBER}: ${LINE}"
	((LINE_NUMBER++))
done < /etc/passwd
