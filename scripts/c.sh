echo -n 'PROD_SECRET=' >> /etc/environment
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 >> /etc/environment
echo -n 'EDGE_SECRET=' >> /etc/environment
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 >> /etc/environment
