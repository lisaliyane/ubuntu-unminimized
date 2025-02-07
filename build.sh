#!/usr/bin/env bash
set -eux

TAGS="24.04"
PLATFORMS="linux/amd64 linux/arm64"

for tag in ${TAGS}
do
    for platform in ${PLATFORMS}
    do
        docker pull ubuntu:$tag --platform $platform 
        docker buildx build -f Dockerfile --platform $platform -t liyane/ubuntu-unminimized:$tag --build-arg TAG=$tag --push.
    done

done
