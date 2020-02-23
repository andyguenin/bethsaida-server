docker run --rm --name prod-db -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /db/bethsaida/prod:/var/lib/postgresql/data postgres

docker run --rm --name edge-db -e POSTGRES_PASSWORD=docker -d -p 5431:5432 -v /db/bethsaida/edge:/var/lib/postgresql/data postgres
