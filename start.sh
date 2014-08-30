#!/usr/bin/env bash

echo "Starting the karaf container\n"

docker run -rm -P -ti --name karaf -v ~/messages:/opt/messages -v ~/deploy:/opt/apache-karaf/deploy granthbr/karaf:3.0.0.b bash




