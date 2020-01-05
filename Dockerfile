FROM alpine/helm:3.0.2

RUN mkdir /workdir
COPY entrypoint.sh /workdir/entrypoint.sh
WORKDIR /workdir

ENTRYPOINT ["/workdir/entrypoint.sh"]