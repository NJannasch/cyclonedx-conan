ARG BASE_IMAGE=gitpod/workspace-full:latest
FROM ${BASE_IMAGE}

ARG USER=gitpod

USER root
RUN apt-get update && apt-get install -y \
  build-essential \
  python3 \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*

USER ${USER}
ENV PATH="${HOME}/.local/bin:$PATH"
RUN export PIP_USER=false
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install poetry