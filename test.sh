#!/usr/bin/env bash
set -euxo pipefail

if [ "$#" -gt 0 ]; then
  exec "$@"
fi

echo "=== Environment ==="
uname -a
cat /etc/os-release
echo

echo "=== Chromium ==="
command -v chromium
chromium --version
echo

echo "=== Running ==="
exec chromium \
  --headless \
  --disable-gpu \
  --dump-dom \
  $( [ "$(id -u)" -eq 0 ] && printf '%s' '--no-sandbox ' )\
  about:blank
