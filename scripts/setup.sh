yum update -y
yum install docker -y
yum install git -y
systemctl start docker
systemctl enable docker

./killall.sh
# rm -rf /etc/letsencrypt/*

mkdir /etc/letsencrypt
mkdir -p /bethsaida/frontend/archive
mkdir /bethsaida/backend
mkdir /bethsaida/well-known

mkdir -p /code/frontend
mkdir -p /code/backend
mkdir -p /build/.ivy2
mkdir -p /build/.sbt

mkdir -p /bethsaida/log
mkdir -p /bethsaida/log/nginx
mkdir -p /bethsaida/log/postgres/prod
mkdir -p /bethsaida/log/postgres/edge
mkdir -p /bethsaida/log/backend/prod
mkdir -p /bethsaida/log/backend/edge


mkdir -p /db/bethsaida/prod
mkdir -p /db/bethsaida/edge
mkdir -p /db/backup
chmod -R 777 /db/backup

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

/bin/bash ./c.sh

groupadd docker
usermod -a -G docker ec2-user

pushd backend-build
./build.sh
popd

pushd frontend-build
./build.sh
popd

pushd database-backup
./build.sh
popd

./scripts/backend-build.sh
./scripts/backend-deploy.sh
./scripts/frontend-build.sh
./scripts/frontend-deploy.sh


crontab -l | { cat; echo "15 21 * * * /home/ec2-user/bethsaida-server/scripts/backup-database.sh prod true "; } | crontab -
crontab -l | { cat; echo "0 0 * * 0 /home/ec2-user/bethsaida-server/cert/renew-cert.sh >> /var/log/renew-cert.log 2>&1"; } | crontab -e
