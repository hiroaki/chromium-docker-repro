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
which chromium
chromium --version
echo

echo "=== Running ==="
exec chromium \
  --headless \
  --no-sandbox \
  --disable-gpu \
  --dump-dom \
  about:blank
