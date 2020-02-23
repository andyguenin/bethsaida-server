prod_version=`cat /bethsaida/frontend/latest.txt`

ln -sfn /bethsaida/frontend/archive/$prod_version /bethsaida/frontend/prod
