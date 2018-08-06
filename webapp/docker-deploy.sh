#!/usr/bin/env bash
echo "Building project .... "
mvn clean package -DskipTests
echo "Stopping existing cointainer ...  "
docker stop webapp
echo "Removing existing cointainer ...  "
docker rm webapp
echo "setting environment variables"
export HOST_HOSTNAME=$(docker-machine active)
export HOST_IP=$(docker-machine ip ${HOST_HOSTNAME})
echo ${HOST_HOSTNAME} ${HOST_IP}
#export CONFIG_HOSTNAME=default
#export CONFIG_HOST_IP=$(docker-machine ip ${CONFIG_HOSTNAME})
export DISCOVERY_HOST=default
export DISCOVERY_IP=$(docker-machine ip default)
export DISCOVERY_PORT=8000
echo ${DISCOVERY_HOST} ${DISCOVERY__IP} ${DISCOVERY_PORT}
echo "Building new container .. "
docker-compose up --build
#docker run --name webapp -p 9000:9000 --network hbo-net -it -d webapp:latest