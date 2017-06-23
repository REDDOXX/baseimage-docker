#!/bin/bash

if [ ${EUID} -ne 0 ]; then
  echo "Must be run as root!"
  exit 1
fi

# Build docker image
export DISABLE_SYSLOG=1
export DISABLE_SSH=1
export DISABLE_CRON=0

make build NAME=baseimage

