FROM ubuntu:24.04

ARG UNAME
ARG UID
ARG GNAME
ARG GID
ARG RUST_VERSION

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN groupdel ${GNAME} \
    && groupadd -o -g ${GID} ${GNAME} \
    && useradd -o -l -u ${UID} -g ${GNAME} -m ${UNAME} \
    && chown ${UNAME}:${GNAME} /home/${UNAME} \
    && sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        ca-certificates \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

USER ${UNAME}

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain ${RUST_VERSION}

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
