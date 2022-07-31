#!/bin/bash
# Accept input from the user (file or directory)
read -p "Please Enter a file or directory:" INPUT_FILE
# check if the file is a regular file
if [ -f ${INPUT_FILE} ]
then
echo "${INPUT_FILE} is a regular file."
exit 0
# check if the file is a directory
elif [ -d ${INPUT_FILE} ]
then
echo "${INPUT_FILE} is a directory."	
exit 1
# if the file is some other type of file
else
echo "${INPUT_FILE} is some unspecified file type."	
exit 2
fi
