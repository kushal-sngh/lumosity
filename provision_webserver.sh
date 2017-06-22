#!/bin/bash
#Delete lumosity folder on re-run
if [ -d "lumosity" ]; then
  rm -rf lumosity
fi

git clone https://github.com/kushal-sngh/lumosity.git

#Optional commands to.You may need them to re-run script.
 
#Stop all containers
docker stop $(docker ps -a -q)

#Delete all containers
docker rm $(docker ps -a -q)

#Delete httpd image if exist
docker rmi -f kushal/webserver

# End of optional commands

#Build new image
docker build --no-cache=false -t kushal/webserver $(pwd)/docker

#Start container from webserver image
docker run -d -p 8080 --name webserver kushal/webserver

sleep 3.0

IPADDR=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' webserver)
#echo $IPADDR

#Test
curl http://${IPADDR}

#Test URL
echo "Type this into browser"
echo "http://${IPADDR}"

 
