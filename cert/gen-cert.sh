docker run -it -v /etc/letsencrypt:/etc/letsencrypt -v /bethsaida/well-known:/bethsaida/well-known cert /certbot-auto certonly -n --agree-tos -m andy@andyguenin.com --webroot --domains bethsaida.downtowndailybread.org --webroot-path /bethsaida/well-known
