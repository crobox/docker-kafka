#!/bin/bash

export REGISTRY_IMAGE="reg.xoborc.com/crobox/infra/docker/crobox-kafka"
# You can remove published containers in: https://lab.xoborc.com/crobox/infra/docker/crobox-kafka
export VERSION_ID="3.3.1"

docker build --pull -t $REGISTRY_IMAGE:latest .
docker tag $REGISTRY_IMAGE:latest $REGISTRY_IMAGE:$VERSION_ID
docker push $REGISTRY_IMAGE:latest
docker push $REGISTRY_IMAGE:$VERSION_ID
docker rmi $REGISTRY_IMAGE:$VERSION_ID