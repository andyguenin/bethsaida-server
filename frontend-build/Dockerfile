from alpine:3.11.3

RUN apk add git npm bash

VOLUME /bethsaida/frontend

VOLUME /code/frontend

COPY ./frontend-build.sh /

COPY ./frontend-deploy.sh /

