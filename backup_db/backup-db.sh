su -s /bin/bash -c "pg_ctl start" postgres

pg_dump -U postgres ddb | gzip -9 > /backup/prod_`date +%Y-%m-%d.%H:%M:%S`.gz

su -s /bin/bash -c "pg_ctl stop" postgres


