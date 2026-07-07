# chromium-docker-repro

Minimal reproduction for running Chromium headless in a Docker container.

## Run locally

```sh
docker build -t chromium-test .
docker run --rm chromium-test
```

## Run in GitHub Actions

Push to GitHub or run the workflow manually.
