#!/bin/bash -eux
# The first argument must be the repo name!

# Setup
export REPO="${1}"
. ./setup.sh

# ls
export INFO=$(curl_reg "${REG_URI}/${VERSION}/${REPO}/tags/list")
echo "${INFO}" | python -m json.tool
