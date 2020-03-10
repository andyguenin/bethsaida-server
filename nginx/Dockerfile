from nginx:1.17.8

VOLUME /etc/letsencrypt

VOLUME /bethsaida/frontend

VOLUME /bethsaida/well-known

VOLUME /var/log/nginx

RUN rm -rf /etc/nginx/conf.d

COPY maint-mode.sh .

COPY prod-mode.sh .

COPY prod.d /etc/nginx/prod.d

COPY maint.d /etc/nginx/maint.d

RUN ln -s /etc/nginx/prod.d /etc/nginx/conf.d
