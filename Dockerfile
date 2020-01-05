FROM alpine/helm:3.0.2

USER root

RUN mkdir /workdir
COPY entrypoint.sh /workdir/entrypoint.sh

ENTRYPOINT ["/workdir/entrypoint.sh"]