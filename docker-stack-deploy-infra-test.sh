#!/usr/bin/env bash
#echo "Building all projects .... "
mvn clean package -DskipTests

echo "Building image - config ...  "
docker build ./config --tag localhost:5000/config:latest
echo "Building image - discovery ...  "
docker build ./discovery --tag localhost:5000/discovery:latest
echo "Building image - gateway ...  "
docker build ./gateway --tag localhost:5000/gateway:latest

echo "Pushing all images to docker hub ...  "
docker push localhost:5000/config:latest
docker push localhost:5000/discovery:latest
docker push localhost:5000/gateway:latest

echo "Removing stack - infra "
docker stack rm infra

echo "setting environment variables"
export DISCOVERY_HOST=discovery
export DISCOVERY_PORT=8000
echo ${DISCOVERY_HOST} ${DISCOVERY_PORT}
export CONFIG_HOST=config
export CONFIG_PORT=9091
echo ${CONFIG_HOST} ${CONFIG_PORT}
echo "Deploying stack - infra "
docker stack deploy -c docker-compose-infra-test.yml infra
