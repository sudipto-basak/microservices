#!/usr/bin/env bash
echo "Building project .... "
mvn clean package -DskipTests
echo "Building image ...  "
#docker build . --tag sudiptobasak/discovery:latest
docker build . --tag localhost:5000/discovery:latest
echo "Pushing image to docker hub ...  "
docker push localhost:5000/discovery:latest
