FROM alpine/helm:3.2.4 AS runtime

# hadolint ignore=DL3002
USER root

# hadolint ignore=DL3018
RUN apk --no-cache --update add git less openssh bash && \
            rm -rf /var/lib/apt/lists/*

RUN apk add --no-cache build-base python3-dev python3 libffi-dev libressl-dev bash git gettext curl \
 && curl -O https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py \
 && pip install --upgrade six awscli awsebcli

RUN mkdir /workdir
COPY entrypoint.sh /workdir/entrypoint.sh
RUN chmod +x /workdir/entrypoint.sh

ENTRYPOINT ["/workdir/entrypoint.sh"]
