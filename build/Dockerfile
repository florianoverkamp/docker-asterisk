FROM debian:buster-slim
LABEL maintainer="Florian Overkamp <f.overkamp@speakup.nl>"

# Install packages
RUN apt-get update && apt-get upgrade -y && \
        apt-get install -y supervisor asterisk fail2ban && \
        apt-get install -y procps && \
        rm -rf /var/lib/apt/lists/*

# Prepare config for usage with mounted volume and fix permissions
RUN cp -a /etc/asterisk /etc/asterisk-skel && \
        mkdir -p /var/run/asterisk && \
        chown asterisk.asterisk /var/run/asterisk

# Install supervisord config and launch script
COPY supervised-asterisk.conf /etc/supervisor/conf.d/supervised-asterisk.conf
COPY docker-entrypoint.sh /

VOLUME /etc/asterisk

EXPOSE 5060/tcp
EXPOSE 5060/udp

WORKDIR /etc/asterisk

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

