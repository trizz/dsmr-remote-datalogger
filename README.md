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
