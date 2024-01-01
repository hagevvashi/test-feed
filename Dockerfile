FROM ubuntu:24.04

ARG UNAME
ARG UID
ARG GNAME
ARG GID
ARG RUST_VERSION

ENV GOSU_PLEASE_LET_ME_BE_COMPLETELY_INSECURE_I_GET_TO_KEEP_ALL_THE_PIECES="I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those moments will be lost in time, like tears in rain. Time to die."

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN groupdel ${GNAME} \
    && groupadd -o -g ${GID} ${GNAME} \
    && useradd -o -l -u ${UID} -g ${GNAME} -m ${UNAME} \
    && chown ${UNAME}:${GNAME} /home/${UNAME} \
    && sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        gosu \
        curl \
        ca-certificates \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && chmod +s $(which gosu)

USER ${UNAME}

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain ${RUST_VERSION}

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
