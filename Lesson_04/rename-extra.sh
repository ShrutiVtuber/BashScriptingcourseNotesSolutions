#!/bin/bash
# store the previous state of null glob
# and then turn nullglob on for the moment
shopt -u | grep -q nullglob && changed=true && shopt -s nullglob

# Go through all of the directory and perform
# the mv action on all of the files of the specified type.
# This will also rename the files with a prefix supplied by the
# user.

# Ask the user for the extension
read -p "Please enter your desired file type (default: jpg)" FILE_TYPE_SUPPLIED

# Set the file type to the user supplied file type
# or if they did not supply a file type set it to
# type .jpg by default
FILE_TYPE=${FILE_TYPE_SUPPLIED:-jpg}

# Ask the user for the prefix
read -p "Please enter your prefix (default: todays date)" PREFIX_SUPPLIED

# Set the prefix to the user supplied prefix
# or if they did not supply a prefix set it to
# the default prefix of the current date YYYMMDD
PREFIX=${PREFIX_SUPPLIED:-$(date '+%Y%m%d')}

# Create a new directory for today's renames
if ! [[ -d ${PREFIX} ]]
then
mkdir "${PREFIX}"
fi

# Loop through the directory 
for FILE in *.${FILE_TYPE}
do
	# Prepend todays date to the .jpg files and then
	# move the files to the newly created directory.
	mv $FILE "${PREFIX}/${PREFIX}-${FILE}"
	# Let the user know the file transfer was complete
	echo "Moved ${FILE} to ${PREFIX}/${PREFIX}-${FILE}"
done
# Reset the nullglob to the settings prior to the script
[ $changed ] && shopt -u nullglob; unset changed
# Exit with 0 in case anyone finds this useful
exit 0
