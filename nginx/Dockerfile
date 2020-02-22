from nginx:1.17.8

VOLUME /etc/letsencrypt

VOLUME /bethsaida/frontend

VOLUME /bethsaida/well-known

RUN mkdir /etc/nginx/conf.d.old/; mv /etc/nginx/conf.d/* /etc/nginx/conf.d.old/

COPY conf.d /etc/nginx/conf.d

