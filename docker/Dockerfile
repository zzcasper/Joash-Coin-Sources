FROM debian:stretch
LABEL maintainer="JoashCoin Developers <dev@joashcoin.org>"
LABEL description="Dockerised JoashCoinCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
