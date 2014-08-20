#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -P  -ti \
       --name karaf \
       -v ~/deploy:/opt/apache-karaf/deploy \
	granthbr/karaf:3.0.0 bash
