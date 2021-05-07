date
docker run -it -v /etc/letsencrypt:/etc/letsencrypt -v /bethsaida/well-known:/bethsaida/well-known cert ./certbot-auto renew
