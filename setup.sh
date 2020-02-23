yum update -y
yum install docker -y
yum install git -y
systemctl start docker
systemctl enable docker

./killall.sh
# rm -rf /etc/letsencrypt/*

mkdir /etc/letsencrypt
mkdir /bethsaida
mkdir -p /bethsaida/frontend/archive
echo '0' > /bethsaida/frontend/prod_version.txt
mkdir /bethsaida/backend
mkdir /bethsaida/well-known

mkdir -p /code/frontend

pushd nginx
./build.sh
./run.sh
popd

#pushd cert
#./build.sh
#./gen-cert.sh
#popd


