#!/bin/bash

VERSION=0.9.22

TARGET_REGISTRY=$1
[ -z "${TARGET_REGISTRY}" ] && TARGET_REGISTRY=localhost:5000

if [ ${EUID} -ne 0 ]; then
  echo "Must be run as root!"
  exit 1
fi

# Build docker image
export DISABLE_SYSLOG=1
export DISABLE_SSH=1
export DISABLE_CRON=0

make build NAME=baseimage

# Push docker image
docker tag baseimage:${VERSION} ${TARGET_REGISTRY}/baseimage:${VERSION}
docker push ${TARGET_REGISTRY}/baseimage:${VERSION}
