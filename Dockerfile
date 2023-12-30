FROM ubuntu:24.04

ENV GOSU_PLEASE_LET_ME_BE_COMPLETELY_INSECURE_I_GET_TO_KEEP_ALL_THE_PIECES="I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those moments will be lost in time, like tears in rain. Time to die."

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        jq \
        gosu \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && chmod +s $(which gosu)

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
