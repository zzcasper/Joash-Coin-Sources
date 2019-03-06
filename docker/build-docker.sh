#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-joashcoinpay/joashcoind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/joashcoind docker/bin/
cp $BUILD_DIR/src/joashcoin-cli docker/bin/
cp $BUILD_DIR/src/joashcoin-tx docker/bin/
strip docker/bin/joashcoind
strip docker/bin/joashcoin-cli
strip docker/bin/joashcoin-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
