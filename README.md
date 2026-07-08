# browser-docker-repro

This repository provides a minimal reproduction for browser-specific issues when running headless browsers inside Docker.


## GitHub Actions

A GitHub Actions workflow is included and can be run manually from the Actions tab.


## Run locally

```sh
docker build --platform linux/amd64 -t browser-docker-repro .
docker run --platform linux/amd64 --rm browser-docker-repro
```

A successful run prints something similar to:

```text
=== Running ===
<html><head></head><body></body></html>
```


## Apple Silicon

When running an **amd64** Docker image on Apple Silicon, the following Docker Desktop option must be enabled:

> **Use Rosetta for x86_64/amd64 emulation on Apple Silicon**


## Tested browsers

The following browser distributions were tested.

| Browser Version | Result |
|-----------------|--------|
| Chromium 150.0.7871.46 built on Debian GNU/Linux 13 (trixie) | ❌ Crashes |
| Google Chrome 150.0.7871.46 | ✅ Works |
| Google Chrome for Testing 150.0.7871.49 | ✅ Works |

> **Note**
>
> These results reflect the browser versions available at the time of testing.
> Future versions of these browsers may produce different results.
