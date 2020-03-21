FROM stevearc/pypicloud

RUN apt-get -y install gettext-base

ADD ./run.sh /run.sh
RUN chmod +x /run.sh

# ENTRYPOINT ["uwsgi", "--die-on-term", "/etc/pypicloud/config.ini"]
CMD ["/bin/sh", "/run.sh"]
