#!/usr/bin/env bash
echo "Building all projects .... "
mvn clean package -DskipTests

echo "Building image - config ...  "
docker build ./config --tag sudiptobasak/config:latest
echo "Building image - discovery ...  "
docker build ./discovery --tag sudiptobasak/discovery:latest
echo "Building image - gateway ...  "
docker build ./gateway --tag sudiptobasak/gateway:latest

echo "Pushing all images to docker hub ...  "
docker push sudiptobasak/config:latest
docker push sudiptobasak/discovery:latest
docker push sudiptobasak/gateway:latest

echo "setting environment variables"
export DISCOVERY_HOST=discovery
export DISCOVERY_PORT=8000
echo ${DISCOVERY_HOST} ${DISCOVERY_PORT}

echo "Building new stack - app "
docker stack deploy -c docker-compose-infra.yml infra
