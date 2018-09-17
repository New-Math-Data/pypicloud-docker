FROM python:3.7.0-alpine3.7
MAINTAINER Laurens-Jan Soer

# After:
# - https://github.com/cirocosta/alpine-envsubst
# - https://github.com/stevearc/pypicloud-docker/tree/master/py3-alpine

EXPOSE 8080
WORKDIR /app/

# Install packages required
ENV PYPICLOUD_VERSION 1.0.9
ENV PLUGINS all_plugins
RUN apk add --no-cache --virtual build-deps gettext python3-dev mariadb-dev postgresql-dev build-base linux-headers openldap-dev && \
	apk add --no-cache libintl libldap libpq mariadb-client-libs util-linux-dev libffi-dev && \
	pip install pypicloud[$PLUGINS]==$PYPICLOUD_VERSION requests uwsgi pastescript mysqlclient psycopg2-binary && \
	cp /usr/bin/envsubst /usr/local/bin/envsubst && \
	adduser -D -s /bin/sh -h /var/lib/pypicloud/ pypicloud && \
	apk del --no-cache build-deps

# Create a working directory for pypicloud
VOLUME /var/lib/pypicloud

# Run as pypicloud user
USER pypicloud

ADD ../run.sh /usr/local/bin/run.sh

CMD ["run.sh"]