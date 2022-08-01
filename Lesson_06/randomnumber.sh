#!/bin/bash
RANDOM_NUMBER=${RANDOM}
echo "${RANDOM_NUMBER}"
logger -i -s -t randomnumber -p user.info "Number: ${RANDOM_NUMBER}"
