#!/bin/bash
#Delete lumosity folder on re-run
if [ -d "lumosity" ]; then
  rm -rf lumosity
fi

#git clone https://github.com/kushal-sngh/lumosity.git

#Optional commands to.You may need them to re-run script.
 
#Stop all containers
docker stop $(docker ps -a -q)

#Delete all containers
docker rm $(docker ps -a -q)

#Delete httpd image if exist
docker rmi -f kushal/webserver
docker rmi -f kushal/oauth

# End of optional commands

#Build new image
docker build --no-cache=false -t kushal/webserver $(pwd)/docker

#Start container from webserver image
docker run -d -p 8080 --name webserver kushal/webserver

#Wait for container is up...
sleep 3.0

WEBIPADDR=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' webserver)
echo "Web Server ${WEBIPADDR}"

#Build new image
docker build --no-cache=false -t kushal/webserver $(pwd)/oauth

#Start container from webserver image
docker run -d -p 8080 --name webserver kushal/oauth

#Wait for container is up...
sleep 3.0


AUTHIPADDR=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' oauth)
echo "Auth Server ${AUTHIPADDR}"


 
