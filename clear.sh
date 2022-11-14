#!/bin/sh
# Clear docker images, volumes and cache

docker rmi -f $(docker images -aq)
docker rm -vf $(docker ps -aq)
docker system prune -a -f --volumes
