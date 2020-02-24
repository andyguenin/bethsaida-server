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

mkdir -p /db/bethsaida/prod
mkdir -p /db/bethsaida/edge

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

/bin/bash ./c.sh

source /etc/environment

pushd backend-build
./build.sh
popd

pushd frontend-build
./build.sh
popd


./scripts/backend-build.sh
./scripts/frontend-build.sh
