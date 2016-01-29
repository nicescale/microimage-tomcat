#!/bin/bash

set -e

export CON_NAME=tomcat_t
export REG_URL=d.nicescale.com:5000
export IMAGE=tomcat
export TAGS="8.0 8.0.26"
export BASE_IMAGE=microimages/jre

docker pull $BASE_IMAGE

docker build -t microimages/$IMAGE .

#./test.sh

echo "---> Starting push microimages/$IMAGE:$VERSION"

for t in $TAGS; do
  docker tag -f microimages/$IMAGE microimages/$IMAGE:$t
done

docker push microimages/$IMAGE
