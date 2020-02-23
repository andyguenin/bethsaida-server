pushd /code/frontend

if [ -d "bethsaida-ui" ]; then
	pushd bethsaida-ui
	git pull origin master
else
	git clone https://github.com/downtowndailybread/bethsaida-ui.git
	pushd bethsaida-ui
fi

prod_version=`git show-ref | grep heads/master | awk -F\  '{print $1}'`

if [ ! -d "/bethsaida/frontend/archive/$prod_version" ]; then
	npm install
	npm run build
	mkdir -p /bethsaida/frontend/archive/$prod_version
	cp -R build/* /bethsaida/frontend/archive/$prod_version
	echo $prod_version > /bethsaida/frontend/latest.txt
fi

