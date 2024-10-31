#!/bin/bash

QPDF_BASE_NAME=qpdf-10-6-3-alpine-3-14-10
QPDF_IMAGE_NAME=$QPDF_BASE_NAME-image
QPDF_CONTAINER_NAME=$QPDF_BASE_NAME-container

docker build -t $QPDF_IMAGE_NAME .

docker run -d --rm --name $QPDF_CONTAINER_NAME $QPDF_IMAGE_NAME tail -f /dev/null

docker cp $QPDF_CONTAINER_NAME:/usr/local/bin bin
docker cp $QPDF_CONTAINER_NAME:/usr/local/lib lib

docker stop $QPDF_CONTAINER_NAME

tar -czvf $QPDF_BASE_NAME-bin.tar.gz bin lib
rm -rf bin lib