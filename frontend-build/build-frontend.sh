if [ ! -d "code" ]; then
	mkdir code
fi

pushd code

if [ -d "bethsaida-ui" ]; then
	rm -rf bethsaida-ui
fi

git clone https://github.com/downtowndailybread/bethsaida-ui.git
pushd bethsaida-ui
prod_version=`git show-ref | grep heads/master | awk -F\  '{print $1}'`

if [ ! -d "/bethsaida/frontend/archive/$prod_version" ]; then
	npm install
	npm run build
	mkdir -p /bethsaida/frontend/archive/$prod_version
	cp -R build/* /bethsaida/frontend/archive/$prod_version
	echo $prod_version > /bethsaida/frontend/latest.txt
fi

