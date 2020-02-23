pushd /app

if [ -d "bethsaida-api" ]; then
        pushd bethsaida-api
        git pull origin master
else
        git clone https://github.com/downtowndailybread/bethsaida-api.git
        pushd bethsaida-api
fi

prod_version=`git show-ref | grep heads/master | awk -F\  '{print $1}'`

if [ ! -f /backend/archive/$prod_version.jar ]; then
        sbt assembly
        mkdir -p /backend/archive
        mv target/scala-2.12/ClientMonitorApi-assembly* /backend/archive/$prod_version.jar
        echo $prod_version > /backend/latest.txt
        ln -sfn /backend/archive/$prod_version.jar /backend/edge.jar 
fi

