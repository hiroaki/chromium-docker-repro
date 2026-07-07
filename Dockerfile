FROM debian:13

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        procps && \
    rm -rf /var/lib/apt/lists/*

# Add the Google Chrome APT repository.
RUN mkdir -p /usr/share/keyrings && \
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | \
      gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
      > /etc/apt/sources.list.d/google-chrome.list

# Install Google Chrome.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

COPY test.sh /usr/local/bin/test.sh

RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["/usr/local/bin/test.sh"]
