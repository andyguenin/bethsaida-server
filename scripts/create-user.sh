
if [ -n "$1" -a -n "$2" -a -n "$3" -n "$4" ]
then
	echo 'usage: create-user.sh environment username password admin'
	exit 1
fi

env=$1
username=$2
password=$3
admin=$4

/usr/local/bin/docker-compose exec postgres-`echo $env` /bin/bash


