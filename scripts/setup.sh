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

pushd nginx
./build.sh
./run.sh
popd

pushd frontend-build
./build.sh
popd

pushd postgresql
./run.sh
popd

#pushd cert
#./build.sh
#./gen-cert.sh
#popd


