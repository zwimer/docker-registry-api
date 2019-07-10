#!/bin/bash -eux
# The first argument must be the repo name!
# The second argument must be the tag!

# Setup
export REPO="${1}"
export TAG="${2}"
. ./setup.sh

# Get digest
export INFO=$(curl_reg -I "${REG_URI}/${VERSION}/${REPO}/manifests/${TAG}")
export DIGEST=$(echo "${INFO}" \
	| awk '$1 == "Docker-Content-Digest:" { print $2 }' \
	| tr -d $'\r' \
)

# Error checking, ensure DIGEST is a sha256
if [ "${#DIGEST}" -ne "$((6+1+64))" ];
then
	echo "ERROR: incorrect digest found:"
	echo "${DIGEST}"
	exit 1
fi

# Delete
echo "Attempting to delete ${REPO}:${TAG} with digest ${DIGEST}"
curl_reg -v -X DELETE "${REG_URI}/${VERSION}/${REPO}/manifests/${DIGEST}"
