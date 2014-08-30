#!/usr/bin/env bash
#echo "Insert pre-built camel route into the deploy folder after the samba share is started\n"

#echo "Starting the karaf container\n"

docker run -rm -P -ti --name karaf -v ~/messages:/opt/messages -v ~/deploy:/opt/apache-karaf/deploy granthbr/karaf:3.0.0.b bash

echo "starting samba share for boot2docker"

docker run --rm -v /usr/local/bin/docker:/docker -e DOCKER_HOST --name samba svendowideit/samba karaf


