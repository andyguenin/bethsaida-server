yum update -y
yum install docker -y
yum install git -y
systemctl start docker
systemctl enable docker

./killall.sh
# rm -rf /etc/letsencrypt/*

mkdir /etc/letsencrypt
mkdir /bethsaida
mkdir /bethsaida/frontend
mkdir /bethsaida/backend
mkdir /bethsaida/well-known

pushd nginx
./build.sh
./run.sh
popd

#pushd cert
#./build.sh
#./gen-cert.sh
#popd


