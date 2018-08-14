FROM quay.io/spivegin/tlmbasedebian

# TLM base Caddy custom build
# created by oyoshi


RUN mkdir /opt/tlm/ /opt/tlm/bin  /opt/tlmtext


ADD ./docker/bash/tlmtextdelivery_entry.sh /opt/config/entry.sh
ADD ./bin/tlmtextdelivery /opt/tlm/bin/
ADD https://raw.githubusercontent.com/adbegon/pub/master/AdfreeZoneSSL.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates --verbose &&\
    ln -s /opt/tlm/bin/tlmtextdelivery /bin/tlmtextdelivery &&\
    chmod +x /opt/config/entry.sh &&\
    apt-get autoclean && apt-get autoremove &&\
	rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

WORKDIR /opt/tlmntext

ENV ONEPASS=oJEh7MeaX3Wdcj3CfCUs \
    NATS_ADDRESS=tls://0.0.0.0 \
    NATS_PORT=443 \
    COCKROACH_ADDRESS=0.0.0.0 \
    COCKROACH_PORT=26257 \
    COCKROACH_DATABASE=tlmsms \
    COCKROACH_USER=a4gFbCeEnq79msktf3dx \
    LISTEN_ON=0.0.0.0 \
    LISTEN_PORT=443

EXPOSE 80 443
ENTRYPOINT ["/opt/config/entry.sh"]
#CMD ["/opt/config/entry.sh"]