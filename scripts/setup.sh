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

./c.sh

source /etc/environment

pushd postgresql
#./run.sh
popd

#pushd cert
#./build.sh
#./gen-cert.sh
#popd


