#!/bin/bash
read -p 'Tag name (default: develop): ' tagname
tagname=${tagname:-develop}

# Setup buildx:
# docker buildx create --name dsmrbuilder
# docker buildx use dsmrbuilder
# docker buildx inspect --bootstrap

docker buildx build --platform linux/amd64,linux/arm64,linux/aarch64,linux/386,linux/arm/v7,linux/arm/v6 -t trizz/dsmr-remote-datalogger:${tagname} --push . && \
docker buildx imagetools inspect docker.io/trizz/dsmr-remote-datalogger:${tagname}
