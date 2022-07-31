#!/bin/bash
# store the previous state of null glob
# and then turn nullglob on for the moment
shopt -u | grep -q nullglob && changed=true && shopt -s nullglob
# Go through all of the directory and perform
# the action on all of the .jpg files
# Set the date variable
TODAY_DATE="$(date '+%Y-%m%d')"
# Create a new directory for today's renames
mkdir "${TODAY_DATE}"
for FILE in *.jpg
do
	# Prepend todays date to the .jpg files and then
	# move the files to the newly created directory.
	mv $FILE "${TODAY_DATE}/${TODAY_DATE}-${FILE}"
	# Let the user know the file transfer was complete
	echo "Moved ${FILE} to ${TODAY_DATE}/${TODAY_DATE}-${FILE}"
done
# Reset the nullglob to the settings prior to the script
[ $changed ] && shopt -u nullglob; unset changed
# Exit with 0 in case anyone finds this useful
exit 0
