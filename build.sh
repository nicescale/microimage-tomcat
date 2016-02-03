#!/bin/bash

set -e

export CON_NAME=tomcat_t
export REG_URL=index.csphere.cn
export IMAGE=microimages/tomcat
export TAGS="8.0 8.0.30"
export BASE_IMAGE=microimages/jre

docker pull $BASE_IMAGE

docker build -t $IMAGE .
./test.sh

docker tag -f $IMAGE $REG_URL/$IMAGE
for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $IMAGE
docker push $REG_URL/$IMAGE
