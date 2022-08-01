#!/bin/bash
RANDOM_NUMBER=${RANDOM}
function logit(){
	local LOG_USER=$1
	local LOG_LEVEL=$2
	shift
	local MESSAGE=$@
	echo "${LOG_USER}"
	echo "${LOG_LEVEL}"
	echo "${MESSAGE}"
	logger -i -s -t randomly -p ${LOG_USER}.${LOG_LEVEL} "${MESSAGE}"
}
logit user info "The random number is: ${RANDOM_NUMBER}"
