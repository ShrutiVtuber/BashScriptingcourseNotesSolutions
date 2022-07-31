# ---- GLOBAL VARIABLES ----
# GLOBAL_DIRECTORY
#	Initalized once the script has confirmed that
#	the directory the user has supplied exists.
# GLOBAL_PROMPT_RESULT
#	Initialized after the prompt_user function has
#	been run and collects the exit code of the function
#	to later be used to let the user know why the script
#	failed if it is unable to return a count of files in
#	in the specified directory.
# GLOBAL_OUTPUT
#	Initialized right befor printing the file count to
#	the user. Merely for ease of formatting.
function prompt_user(){
	local local_directory="default"
	# Prompt the user for the DIRECTORY
	read -p "Please specify a directory: " local_directory
	# Check if directory exists
	if [ -d ${local_directory} ]
	then
		# if it exists then set it to
		# the global_DIRECTORY variable
		GLOBAL_DIRECTORY=$local_directory
	else
		# if it doesn't exist let the 
		# user know and return 1
		echo "${local_directory} does not exist."
		return 1
	fi
}
function file_count(){
	ls $GLOBAL_DIRECTORY | wc -l
}

# prompt the user for a directory
# and verify that it exists
prompt_user
GLOBAL_PROMPT_RESULT=$?
if [ "${GLOBAL_PROMPT_RESULT}" -eq 0 ]
then
	# the directory exists
	# proceed to count the files within the directory
	GLOBAL_OUTPUT="${GLOBAL_DIRECTORY}:\n$(file_count ${GLOBAL_DIRECTORY})"
	echo -e ${GLOBAL_OUTPUT}
	exit 0
elif [ "${GLOABAL_PROMPT_RESULT}" -eq 1 ]
then
	# exit with error code one
	# the directory does not exist and the user
	# has been notified. No further logging is
	# nessecary
	exit 1
else
	# some unspecified error has occured and the
	# user ought to be notified. Further loging
	# is most likely required.
	echo "An unspecified error has occured with the  
		supplied directory. No further information  
		is available. Sorry."
	exit 2
fi

