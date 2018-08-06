#!/usr/bin/env bash
#echo "Building project .... "
#mvn clean package -DskipTests
echo "Stopping existing cointainer ...  "
docker stop discovery
echo "Removing existing cointainer ...  "
docker rm discovery
echo "setting environment variables"
export HOST_HOSTNAME=$(docker-machine active)
echo "Building new container .. "
docker-compose up --build
#docker run --name webapp -p 9000:9000 --network hbo-net -it -d webapp:latest