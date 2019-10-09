#!/bin/bash
# DO NOT USE THIS FILE TO RUN THE DATA LOGGER!

docker build . -t trizz/dsmr-remote-datalogger:develop && \
docker run -d \
    -e DSMR_USB_PORT=/dev/ttyUSB0 \
    -e DSMR_API_URL=https://127.0.0.1/api/v1/datalogger/dsmrreading \
    -e DSMR_API_KEY=fake_key \
    -e LOG_LEVEL=debug \
    -v $(pwd)/log_mount:/etc/dsmr_logs \
    trizz/dsmr-remote-datalogger:develop
