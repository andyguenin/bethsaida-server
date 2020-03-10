env=prod
if [ -n "$1" ]
then
	env=$1
fi

echo "Backing up $env database"

su -s /bin/bash -c "pg_ctl start" postgres

pg_dump -U postgres ddb | gzip -9 > /db/backup/`echo $env`_`date +%Y%m%d.%H%M%S`.gz

su -s /bin/bash -c "pg_ctl stop" postgres


