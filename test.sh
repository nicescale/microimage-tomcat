#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE

if [ ! -f /tmp/sample.war ]; then
  wget -O /tmp/sample.war https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war
fi
docker cp /tmp/sample.war $CON_NAME:/app/
sleep 2
docker exec $CON_NAME ps ax|grep "tomca[t]"
docker exec $CON_NAME wget -O - http://localhost/sample/|grep "Hello, World"

docker rm -f $CON_NAME

echo "---> The test pass"
