# dsmr-remote-datalogger
Docker container for the [DSMR Reader Remote Datalogger](https://dsmr-reader.readthedocs.io/en/latest/api.html#script).

## Usage
You can pass the host and the API key as environment variables and optionally also pass the 
the USB device (default: `/dev/ttyUSB0`). Don't forget to add the `--device` parameter to make your DSMR cable available
in the docker container, or run the container with the `--privileged` flag (not recommended).

```
docker run -d \
    --device=/dev/ttyUSB0 \
    -e DSMR_USB_PORT=/dev/ttyUSB0 \
    -e DSMR_API_URL=https://<YOUR_DSMR_HOST>/api/v1/datalogger/dsmrreading \
    -e DSMR_API_KEY=<YOUR_API_KEY> \
    trizz/dsmr-remote-datalogger:latest
```

Log files are being written to `/etc/dsmr_logs` in the container. Override this
location if you want to keep logfiles between containers or have easy access to them:
`-v /path/on/host:/etc/dsmr_logs`