docker run -d --name nginx -p 80:80 -v /bethsaida/frontend:/bethsaida/frontend -v /etc/letsencrypt:/etc/letsencrypt -v /bethsaida/well-known:/bethsaida/well-known frontend
