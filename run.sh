#!/bin/bash

cd build/
docker stop asterisk
docker rm asterisk
docker build -t asterisk .
docker run -d --rm --name=asterisk \
  -p 5060:5060 \
  -v ~/docker/docker-asterisk/config:/etc/asterisk \
  asterisk
docker exec -it asterisk /bin/bash

