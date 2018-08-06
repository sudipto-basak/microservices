#!/usr/bin/env bash
echo "Building project .... "
mvn clean package -DskipTests
echo "Stopping existing cointainer ...  "
docker stop resort
echo "Removing existing cointainer ...  "
docker rm resort
echo "setting environment variables"
export HOST_HOSTNAME=$(docker-machine active)
export CONFIG_HOSTNAME=$(docker-machine active)
export CONFIG_HOST_IP=$(docker-machine ip $(docker-machine active))
export DISCOVERY_HOSTNAME=$(docker-machine active)
export DISCOVERY_HOST_IP=$(docker-machine ip $(docker-machine active))
echo "Building new container .. "
docker-compose up --build
#docker run --name webapp -p 9000:9000 --network hbo-net -it -d webapp:latest