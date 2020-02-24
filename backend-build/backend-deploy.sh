prod_version=`cat /bethsaida/backend/latest.txt`

ln -sfn /bethsaida/backend/archive/$prod_version.jar /bethsaida/backend/prod.jar
