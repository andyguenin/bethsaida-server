if [ -z "$1" ]
then
	echo 'missing parameter'
else
	echo "Restoring from file $1"
	su -s /bin/bash -c "pg_ctl start" postgres
	psql -U postgres -c "drop database if exists ddb;";
	psql -U postgres -c "create database ddb;"
        gunzip -c $1 | psql -U postgres ddb
	su -s /bin/bash -c "pg_ctl stop" postgres
fi
