#!/bin/bash

IMAGE=czinkos/tt-solr:example
CONTAINER=tt-solr-example

echo Start container
docker run --rm --name $CONTAINER -p 8983:8983 -d $IMAGE

echo %%%%%%%%%%%%%%%%%%
echo "wait 5 seconds for solr"
echo %%%%%%%%%%%%%%%%%%
sleep 5

echo %%%%%%%%%%%%%%%%%%
echo "Copy sample data to container"
echo %%%%%%%%%%%%%%%%%%
docker cp test/data.xml $CONTAINER:/tmp

echo %%%%%%%%%%%%%%%%%%
echo "Index sample data"
echo %%%%%%%%%%%%%%%%%%
docker exec -it $CONTAINER bin/post -c example /tmp/data.xml

echo %%%%%%%%%%%%%%%%%%
echo "Post text to tagger"
echo %%%%%%%%%%%%%%%%%%
curl -X POST -H "Content-Type: text/plain" -d "@test/test.txt" "http://localhost:8983/solr/example/tag?wt=json&indent=yes"

echo %%%%%%%%%%%%%%%%%%
echo "Stop container"
echo %%%%%%%%%%%%%%%%%%
docker stop $CONTAINER
