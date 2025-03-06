
# Docker Image Scanning

This project demonstrates how to build and scan a Docker image for vulnerabilities using Trivy.

## Project Structure

```
.
├── Dockerfile           # Dockerfile to create a vulnerable image
├── LICENSE              # Project License
└── vulnerable_app.sh    # A script added to the image to simulate vulnerability
```

## Overview

This project includes a Dockerfile that creates a vulnerable Docker image based on Ubuntu 18.04. It installs several packages and copies a vulnerable script (`vulnerable_app.sh`) into the image.

The image is then scanned for vulnerabilities using [Trivy](https://github.com/aquasecurity/trivy), a popular vulnerability scanner for Docker images.

## Dockerfile

The `Dockerfile` used to build the Docker image is as follows:

```Dockerfile
FROM ubuntu:18.04 

RUN apt-get update && apt-get install -y     curl     wget     python2.7     openssl     && apt-get clean

COPY vulnerable_app.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/vulnerable_app.sh

CMD ["/bin/bash"]
```

- **Base Image**: The image uses `ubuntu:18.04` as the base image.
- **Packages Installed**: The `RUN` command installs `curl`, `wget`, `python2.7`, and `openssl`.
- **Vulnerable Script**: The script `vulnerable_app.sh` is copied into `/usr/local/bin/` and made executable.
- **Default Command**: The container starts with `/bin/bash`.

## Build the Docker Image

To build the Docker image, run the following command in your terminal:

```bash
docker build -t scan-build .
```

This will create a Docker image named `scan-build`.

## Scan Docker Image for Vulnerabilities

Once the Docker image is built, you can scan it for vulnerabilities using [Trivy](https://github.com/aquasecurity/trivy), a security scanner that identifies vulnerabilities in your container images.

### Scan the Image for Critical Vulnerabilities

To scan for critical vulnerabilities, use the following command:

```bash
trivy image --severity CRITICAL scan-build
```

### Full Image Scan

To perform a full vulnerability scan, use this command:

```bash
trivy image scan-build
```

Trivy will output a list of vulnerabilities found in the image, including their severity level and any suggested fixes.

## Medium Article

For a more detailed guide on scanning vulnerabilities in Docker images, check out my [Medium article](https://medium.com/@husnainali593/scanning-vulnerabilities-in-docker-images-with-trivy-891c46a152e7).