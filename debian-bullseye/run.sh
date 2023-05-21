#!/bin/sh

LOCAL_REGISTRY="${LOCAL_REGISTRY:-buildregistry.localdomain}"

LATEST_IMAGE="${LOCAL_REGISTRY}/debian-bullseye:latest"

# docker run --interactive --tty --rm --name debian --hostname debian buildregistry.localdomain/debian-bullseye:latest
# docker run --interactive --tty --rm --name debian --hostname debian $LATEST_IMAGE
docker run --interactive --tty --rm --name debian --hostname debian --net=host --cap-add=ALL $LATEST_IMAGE

