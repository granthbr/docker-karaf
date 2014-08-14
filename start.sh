#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -p 8181 -d -t \
       --name karaf \ 
       -v deploy:/opt/apache-karaf/deploy \
	granthbr/karaf:3.0.0 
