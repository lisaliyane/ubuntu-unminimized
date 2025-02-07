#!/usr/bin/env bash
set -eux

TAGS="24.04"
PLATFORMS="linux/amd64 linux/arm64"

for tag in ${TAGS}
do
    for platform in ${PLATFORMS}
    do
        docker pull ubuntu:$tag --platform $platform 
    done

    docker buildx build -f Dockerfile --platform $(echo "$PLATFORMS" | tr ' ' ',') -t liyane/ubuntu-unminimized:$tag --build-arg TAG=$tag --push .

done
