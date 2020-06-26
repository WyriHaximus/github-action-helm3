FROM alpine/helm:3.2.4

# hadolint ignore=DL3002
USER root

RUN apk --update add git less openssh bash && \
            rm -rf /var/lib/apt/lists/* && \
            rm /var/cache/apk/*

RUN mkdir /workdir
COPY entrypoint.sh /workdir/entrypoint.sh
RUN chmod +x /workdir/entrypoint.sh

ENTRYPOINT ["/workdir/entrypoint.sh"]
