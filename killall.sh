docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi --force $(docker images -q)
