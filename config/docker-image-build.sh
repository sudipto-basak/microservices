#!/usr/bin/env bash
echo "Building project .... "
mvn clean package -DskipTests
echo "Building image ...  "
#docker build . --tag sudiptobasak/config:latest
docker build . --tag localhost:5000/config:latest
echo "Pushing image to docker hub ...  "
docker push localhost:5000/config:latest
