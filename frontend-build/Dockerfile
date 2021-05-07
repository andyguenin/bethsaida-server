from alpine:3.11.3

RUN apk add git npm bash

RUN git config --global user.email bethsaida@pinestreet.org

RUN git config --global user.name Bethsaida

VOLUME /bethsaida/frontend

VOLUME /code/frontend

COPY ./frontend-build.sh /

COPY ./frontend-deploy.sh /

