FROM debian:13

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      chromium \
      ca-certificates \
      procps && \
    rm -rf /var/lib/apt/lists/*

COPY test.sh /usr/local/bin/test.sh

RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["/usr/local/bin/test.sh"]
CMD []
