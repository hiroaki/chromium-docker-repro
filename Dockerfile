FROM debian:13

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        unzip \
        procps && \
    rm -rf /var/lib/apt/lists/*

# Download the latest Stable Chrome for Testing.
RUN set -eux; \
    JSON_URL="https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json"; \
    URL="$(curl -fsSL "$JSON_URL" | \
        jq -r '.channels.Stable.downloads.chrome[] | select(.platform=="linux64") | .url')"; \
    echo "Downloading: ${URL}"; \
    curl -fsSL "$URL" -o /tmp/chrome.zip; \
    unzip -q /tmp/chrome.zip -d /opt; \
    rm /tmp/chrome.zip

# Install the system dependencies recommended by Google.
RUN set -eux; \
    apt-get update; \
    while IFS= read -r pkg; do \
        apt-get satisfy -y --no-install-recommends "$pkg"; \
    done < /opt/chrome-linux64/deb.deps; \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /opt/chrome-linux64/chrome /usr/local/bin/google-chrome

COPY test.sh /usr/local/bin/test.sh

RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["/usr/local/bin/test.sh"]
