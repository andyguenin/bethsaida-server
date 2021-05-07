pushd /home/ec2-user/bethsaida-server/scripts/
env=prod
load_prod_in_edge=false
if [ -n "$1" ]
then
	env=$1
	if [ -n "$2" -a $env == prod ]
	then
		load_prod_in_edge=true
	fi
fi

echo '---Maint Mode'
./maint-mode.sh
echo '---Stop backend'
/usr/local/bin/docker-compose stop backend-`echo $env`
echo '---Stop database'
/usr/local/bin/docker-compose stop postgres-`echo $env`
echo '---Generate backup'
docker run --rm -v /db/backup:/db/backup -v /db/bethsaida/`echo $env`/:/var/lib/postgresql/data database-backup backup `echo $env`
echo '--Start database'
/usr/local/bin/docker-compose start postgres-`echo $env`
echo '---Start backend'
/usr/local/bin/docker-compose start backend-`echo $env`
echo '---Prod mode'
./prod-mode.sh
echo '---Copy to s3'
su -s /bin/bash -c "aws s3 --recursive cp /db/backup/ s3://bethsaida-database-backup" ec2-user

if [ $load_prod_in_edge == true ]
then
	/usr/local/bin/docker-compose stop backend-edge
	/usr/local/bin/docker-compose stop postgres-edge
	docker run --rm -v /db/backup:/db/backup -v /db/bethsaida/edge:/var/lib/postgresql/data database-backup restore `ls -td /db/backup/* | grep prod | head -n 1`
	/usr/local/bin/docker-compose start postgres-edge
	/usr/local/bin/docker-compose start backend-edge
fi

rm -rf /db/backup/*
echo '--restart nginx'
/usr/local/bin/docker-compose restart bethsaida-nginx

popd
