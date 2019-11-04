#!/bin/bash -eux

# Setup
export NUM_RESULTS=999999
. ./setup.sh

# ls
export INFO=$(curl_reg "${REG_URI}/${VERSION}/_catalog?n=${NUM_RESULTS}")
echo "${INFO}" | python -m json.tool
