#!/bin/bash -e

REPO=czinkos/tt-solr

docker build -t $REPO . 
docker tag $REPO $REPO:base
docker build -t $REPO:example -f Dockerfile.example .
docker build -t $REPO:hu -f Dockerfile.hu .

echo OK
docker images | grep $REPO

