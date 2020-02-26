FROM alpine/helm:3.1.1

# hadolint ignore=DL3002
USER root

RUN mkdir /workdir
COPY entrypoint.sh /workdir/entrypoint.sh
RUN chmod +x /workdir/entrypoint.sh

ENTRYPOINT ["/workdir/entrypoint.sh"]