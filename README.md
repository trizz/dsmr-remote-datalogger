# dsmr-remote-datalogger
Docker container for the [DSMR Reader Remote Datalogger](https://dsmr-reader.readthedocs.io/en/latest/installation/datalogger.html).
No modifications are made to the script so you can use it as described in the [documentation](https://dsmr-reader.readthedocs.io/en/latest/installation/datalogger.html#api-config-env)
but without the need to configure a Python environment yourself.

## Usage
You can pass the host and the API key as environment variables and optionally also pass the 
the USB device (default: `/dev/ttyUSB0`). Don't forget to add the `--device` parameter to make your DSMR cable available
in the docker container, or run the container with the `--privileged` flag (not recommended).

Make sure that if you use a different port for the reader instance of DSMR, instead of the default 80(http) or 443(https), it's included in <YOUR_HOST_URL>.

```
docker run -d \
    --device=/dev/ttyUSB0 \
    --name dsmr-remote-datalogger \
    -e DATALOGGER_API_HOSTS=<YOUR_HOST_URL> \
    -e DATALOGGER_API_KEYS=<YOUR_API_KEY> \
    -e DATALOGGER_INPUT_METHOD=serial \
    -e DATALOGGER_SERIAL_PORT=/dev/ttyUSB0 \
    -e DATALOGGER_SERIAL_BAUDRATE=115200 \
    trizz/dsmr-remote-datalogger:latest
```

Log files are being written to the default Docker logs. You can use `docker logs dsmr-remote-datalogger`
to view them.

## Supported architectures:
- `linux/amd64`
- `linux/arm64`
- `linux/386`
- `linux/arm/v7`
- `linux/arm/v6`

It is not necessary to define the architecture you want to use when creating a container, Docker will try 
to find and match the correct image for your host. 

## Versioning
This project uses [Semver](https://semver.org) for versioning. For each release three Docker images will
be provided:
- `latest` - Using this image will ensure you always have the latest version.
- `v1` - This image will be created for every release in the v1.x.x branch. Use this image if you want the latest version, but also want to be sure updating your container does not break stuff.
- `v1.0.0` - For each version an image will be created for those who want to use a specific version.  
