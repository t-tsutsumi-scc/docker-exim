FROM debian:12.0-slim

RUN set -eux; \
    apt-get update; \
    apt-get dist-upgrade -y; \
    apt-get install -y --no-install-recommends exim4-daemon-light gosu; \
    apt-get clean; \
    rm -rfv /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    find /var/log/* -maxdepth 0 -not -name exim4 | xargs rm -rfv

COPY docker-entrypoint.sh /usr/local/bin

EXPOSE 25

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["exim", "-bd", "-q15m", "-v"]
