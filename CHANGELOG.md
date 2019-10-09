## Changelog

### Unreleased / develop

### v1.0.0 - 2019-10-09
- Replace console output with a (rotating) log handler.
- Move to `python:3-alpine` base image for greater compatibility with different platforms.
- Extract the dependencies to `requirements.txt`.
- Using `buildx` to create images for the following platforms:
  - `linux/amd64`
  - `linux/arm64`
  - `linux/386`
  - `linux/arm/v7`
  - `linux/arm/v6`

### v0.1.0
- Initial release.
