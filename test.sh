#!/usr/bin/env bash
set -euxo pipefail

if [ "$#" -gt 0 ]; then
  exec "$@"
fi

echo "=== Environment ==="
uname -a
cat /etc/os-release
echo

echo "=== Google Chrome ==="
command -v google-chrome
google-chrome --version
echo

echo "=== Running ==="
exec google-chrome \
  --headless \
  --disable-gpu \
  --dump-dom \
  $( [ "$(id -u)" -eq 0 ] && printf '%s' '--no-sandbox ' )\
  about:blank
