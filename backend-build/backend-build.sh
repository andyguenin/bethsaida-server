pushd /app

if [ -d "bethsaida-api" ]; then
        pushd bethsaida-api
        git pull origin master
else
        git clone https://github.com/downtowndailybread/bethsaida-api.git
        pushd bethsaida-api
fi

prod_version=`git show-ref | grep heads/master | awk -F\  '{print $1}'`

if [ ! -f /bethsaida/backend/archive/$prod_version.jar ]; then
        sbt assembly
        mkdir -p /bethsaida/backend/archive
        mv target/scala-2.12/ClientMonitorApi-assembly* /bethsaida/backend/archive/$prod_version.jar
        echo $prod_version > /bethsaida/backend/latest.txt
        ln -sfn /bethsaida/backend/archive/$prod_version.jar /bethsaida/backend/edge.jar 
fi

