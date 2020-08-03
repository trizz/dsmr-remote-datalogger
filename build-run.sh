#!/bin/bash
# DO NOT USE THIS FILE TO RUN THE DATA LOGGER!

docker rm dsmrtest ;
docker build . -t trizz/dsmr-remote-datalogger:develop && \
docker run -d \
    --env-file settings.txt \
    --name dsmrtest \
    trizz/dsmr-remote-datalogger:develop &&
sleep 2 && docker logs dsmrtest