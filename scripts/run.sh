pushd ../nginx
./build.sh
./run.sh
popd

pushd ../postgresql
./run.sh
popd
