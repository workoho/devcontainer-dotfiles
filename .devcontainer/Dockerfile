# syntax=docker/dockerfile:1.4

ARG VARIANT="ubuntu"

FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

ARG devcontainercli

RUN \
    if [ -z "$devcontainercli" ] ; then \
        printf "\nERROR: This Dockerfile needs to be built with Visual Studio Code or using the devcontainer-cli !" && exit 1; \
    else \
        printf "devcontainer-cli is detected: $devcontainercli"; \
    fi \
    # Upgrade OS
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y upgrade --no-install-recommends \
    # Install common admin command line tools
    && apt-get install -y --no-install-recommends \
        # Common tools
        fontconfig \
        # Networking tools
        dnsutils \
        iputils-arping \
        iputils-ping \
        netcat-openbsd \
        openssh-client \
        # Terminal tools
        screen \
        tmux \
    # Generate Font Cache
    && fc-cache -f -v \
    # Clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
