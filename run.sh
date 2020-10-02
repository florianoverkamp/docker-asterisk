#!/bin/bash

cd build/
docker stop test
docker rm test
docker build -t asterisk .
docker run -d --rm --name=test \
  -p 5060:5060 \
  -v /home/florian/docker/asterisk/config:/etc/asterisk \
  asterisk
docker exec -it test /bin/bash

