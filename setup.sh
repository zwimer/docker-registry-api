#!/bin/bash -eux
# This file should be sourced

# Config
. ./config.sh

# Setup curl_reg
export H_FLAG="Accept: application/vnd.docker.distribution.manifest.v2+json"
curl_reg() { curl -sSL -H "${H_FLAG}" --user "${REG_USER}:${REG_PASS}" $@; }
