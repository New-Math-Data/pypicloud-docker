# Pypicloud docker image

This is a docker image for pypicloud with envsubst. `envsubst` is included to be able to substitute variables in the `config.ini`.

It is meant for usage with a helm chart, but may be suitable for other purposes.

This image is based on:
- https://github.com/stevearc/pypicloud-docker
- https://github.com/cirocosta/alpine-envsubst

## Providing config
This image assumes that config is present at `/etc/pypicloud/config-template.ini`. It performs variable substitution for this file upon starting and renders it into `/etc/pypicloud/config.ini`

## Versions
*3.8-gcs-redis*
Uses alpine version 3.8, python 3.7 and installs gcs and redis dependencies for pypicloud. This image is slightly smaller.

*3.7-all-plugins*
Uses alpine version 3.7 (apk mariadb dependencies not available for 3.8), and installs all available dependencies for pypicloud.

## Running locally
`docker run --rm -v /path/to/config:/etc/pypicloud laurensjansoer/pypicloud-docker:gcs-redis`