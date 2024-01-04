FROM docker.io/caddy:2.7.6-builder AS builder

LABEL maintainer="PopeRigby <poperigby@mailbox.org>"
LABEL org.opencontainers.image.source="https://github.com/poperigby/caddy"
LABEL org.opencontainers.image.description="PopeRigby's custom build of the caddy webserver"

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM docker.io/caddy:2.7.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
