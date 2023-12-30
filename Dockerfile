FROM ubuntu:24.04

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
        jq \
        gosu \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
