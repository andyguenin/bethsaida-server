env=edge
if [ -z "$1" ]
then
	echo 'you must specify an environment'
	return 1
fi

env=$1
if [ -z "$2" ]
then
	echo 'you must specify a file'
	return 1
fi

file=$2

docker-compose stop backend-`echo $env`
docker-compose stop postgres-`echo $env`
docker run -it -v /db/backup:/db/backup -v /db/bethsaida/`echo $env`/:/var/lib/postgresql/data database-backup restore `echo $file`
docker-compose start postgres-`echo $env`
docker-compose start backend-`echo $env`


