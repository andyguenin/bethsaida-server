mkdir code

pushd code

git clone https://github.com/downtowndailybread/bethsaida-ui.git

pushd bethsaida-ui

npm install

npm run build 

current_prod=`cat /bethsaida/frontend/prod_version.txt`

new_prd=$(($current_prod + 1))

mkdir /bethsaida/frontend/archive/$new_prd

cp -R build/* /bethsaida/frontend/archive/$new_prd

ln -s /bethsaida/frontend/archive/$new_prd /bethsaida/frontend/prod

echo $new_prd > /bethsaida/frontend/prod_version.txt
