#!/bin/bash

podman pull --policy=newer alpine:latest

TAG=$(date +%Y%m%d)
podman build -t claude:latest -t claude:$TAG -f Containerfile
