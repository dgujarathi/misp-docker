#!/bin/bash
 
version=$1
registry=$2
 
if [ -z $version ]; then
    echo "version not specified"
    exit
fi
 
if [ -z $registry ]; then
    registry="548694502413.dkr.ecr.ap-south-1.amazonaws.com"
fi
 
cd /var/www/infitip-docker/infitip-engine
docker build -t infitip/infitip-engine .
docker tag $registry/infitip/infitip-engine:$version $registry/infitip/infitip-engine:latest
docker push $registry/infitip/infitip-engine:$version
docker push $registry/infitip/infitip-engine:latest

cd /var/www/infitip-docker/infitip-app
docker build -t infitip/infitip-app .
docker tag $registry/infitip/infitip-app:$version $registry/infitip/infitip-app:latest
docker push $registry/infitip/infitip-app:$version
docker push $registry/infitip/infitip-app:latest
