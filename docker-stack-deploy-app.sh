#!/usr/bin/env bash
echo "Building all projects .... "
mvn clean package -DskipTests
echo "Building image - resort ...  "
docker build ./resort --tag localhost:5000/resort:latest
echo "Pushing image webapp to docker hub ...  "
docker push localhost:5000/resort:latest

echo "Removing stack - app "
docker stack rm app

echo "setting environment variables"
export DISCOVERY_HOST=discovery
export DISCOVERY_PORT=8000
echo ${DISCOVERY_HOST} ${DISCOVERY_PORT}
export CONFIG_HOST=config
export CONFIG_PORT=9091
echo ${CONFIG_HOST} ${CONFIG_PORT}

echo "Building new stack - app "
docker stack deploy -c docker-compose-app.yml app
