FROM python:3.9-slim-bullseye

ENV GAM_VERSION=6.21
ENV DEBIAN_FRONTEND=noninteractive

COPY gam-wrapper.sh /usr/bin/gam-wrapper.sh

RUN BUILD_TOOLS="curl swig gcc libpcsclite-dev" \
    && apt-get update \
    && apt-get install -yqq ${BUILD_TOOLS} \
    && cd /tmp \
    && curl -L -o /tmp/v$GAM_VERSION.tar.gz https://github.com/jay0lee/GAM/archive/v$GAM_VERSION.tar.gz \
    && mkdir /gam \
    && tar -C /gam -zxf /tmp/v$GAM_VERSION.tar.gz \
    && cd /gam && mv GAM-${GAM_VERSION}/* . \
    && pip install --no-cache-dir -r /gam/src/requirements.txt \
    && touch /gam/src/nobrowser.txt /gam/src/noupdatecheck.txt \
    && rm -rf /gam/GAM-${GAM_VERSION} \
    && chmod 0755 /usr/bin/gam-wrapper.sh \
    && apt remove -yqq $BUILD_TOOLS \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

WORKDIR /gam

ENTRYPOINT [ "/usr/bin/gam-wrapper.sh" ]
