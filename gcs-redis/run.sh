substenv < /etc/pypicloud/config-template.ini > /etc/pypicloud/config.ini
uwsgi --die-on-term /etc/pypicloud/config.ini