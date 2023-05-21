#!/bin/sh

# docker build -t debian-bullseye .

LOCAL_REGISTRY="${LOCAL_REGISTRY:-buildregistry.localdomain}"

GIT_SHA=$(git rev-parse HEAD | cut -c 1-8)
CURRENT_TS=$(date "+%Y%m%d%H%M%S")

IMAGE="${LOCAL_REGISTRY}/debian-bullseye:${GIT_SHA}-${CURRENT_TS}"
LATEST_IMAGE="${LOCAL_REGISTRY}/debian-bullseye:latest"

# docker build -t "debian-bullseye:${CURRENT_TS}" .
docker build --pull --no-cache=true -t $IMAGE -f Dockerfile .
docker push $IMAGE
docker tag $IMAGE $LATEST_IMAGE
docker push $LATEST_IMAGE

