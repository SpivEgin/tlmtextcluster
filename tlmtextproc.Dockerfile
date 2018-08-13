FROM quay.io/spivegin/tlmbasedebian

# TLM base Caddy custom build
# created by oyoshi


RUN mkdir /opt/tlm/ /opt/tlm/bin  /opt/tlmtext /opt/dumb_init/


ADD ./docker/bash/tlmtextproc_entry.sh /opt/config/entry.sh
ADD ./bin/tlmtextproc /opt/tlm/bin/
ADD ./docker/dumb-init/dumb-init_1.2.0_amd64.deb /opt/dumb_init/
ADD https://raw.githubusercontent.com/adbegon/pub/master/AdfreeZoneSSL.crt /usr/local/share/ca-certificates/

RUN dpkg -i /opt/dumb_init/dumb-init_1.2.0_amd64.deb && \
    rm -rf /opt/dumb_init &&\
    update-ca-certificates --verbose &&\
    ln -s /opt/tlm/bin/tlmtextproc /bin/tlmtextproc &&\
    chmod +x /opt/config/entry.sh &&\
    apt-get autoclean && apt-get autoremove &&\
	rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

WORKDIR /opt/tlmntext

ENV ONEPASS=knC3Ewrpd97A4fteiFsq \
    NATS_ADDRESS=tls://0.0.0.0 \
    NATS_PORT=443 \
    COCKROACH_ADDRESS=0.0.0.0 \
    COCKROACH_PORT=26257 \
    COCKROACH_DATABASE=tlmsms \
    COCKROACH_USER=a4gFbCeEnq79msktf3dx \
    LISTEN_ON=0.0.0.0 \
    LISTEN_PORT=8443

EXPOSE 8443
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/config/entry.sh"]
