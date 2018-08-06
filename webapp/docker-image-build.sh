#!/usr/bin/env bash
echo "Building project .... "
mvn clean package -DskipTests
echo "Building image ...  "
docker build . --tag sudiptobasak/webapp:latest
echo "Pushing image to docker hub ...  "
docker push sudiptobasak/webapp:latest
