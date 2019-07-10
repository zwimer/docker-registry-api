#!/bin/bash -eux

# Setup
. ./setup.sh

# ls
export INFO=$(curl_reg "${REG_URI}/${VERSION}/_catalog")
echo "${INFO}" | python -m json.tool
