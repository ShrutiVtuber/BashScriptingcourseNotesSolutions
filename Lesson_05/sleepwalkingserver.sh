#!/bin/bash
COMMAND_VARIABLE="$1"
#echo $COMMAND_VARIABLE
case "${COMMAND_VARIABLE}" in
	[sS][tT][aA]*)
	echo "Starting sleepwalkingserver.pid"
	/tmp/sleepwalkingserver
	;;
	[sS][tT][oO]*)
	echo "Stopping sleepwalkingserver.pid"
	kill $(cat /tmp/sleepwalkingserver)
	;;
esac
