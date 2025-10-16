# syntax=docker/dockerfile:1

FROM docker.io/ubuntu:24.04

ARG GPU_DRIVER

ENV GPU_DRIVER=$GPU_DRIVER

USER root

RUN set -exu \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -yq update \
  && apt-get -yq install \
    bash \
    curl \
    nano \
    wget \
    git \
    python3 \
    python3-venv \
    python3-pip \
    pipx \
  && apt-get -yq clean

RUN set -exu \
  && addgroup \
    --gid 1101 \
    invokeai \
  && adduser \
    --uid 1101 \
    --ingroup invokeai \
    --disabled-password \
    --gecos invokeai \
    invokeai

# invokeai repo assumed to have been cloned for us
COPY ./entrypoint.sh /entrypoint.sh
COPY --chown=invokeai:invokeai ./invokeai /home/invokeai/invokeai-source
COPY --chown=invokeai:invokeai ./install-invokeai.sh /install-invokeai.sh

USER invokeai
WORKDIR /home/invokeai

SHELL ["/bin/bash", "-c"]

RUN set -exu \
  && /bin/bash /install-invokeai.sh $GPU_DRIVER

ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
