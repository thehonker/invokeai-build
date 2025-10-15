# syntax=docker/dockerfile:1

FROM docker.io/ubuntu:24.04

ARG GPU_DRIVER

ENV GPU_DRIVER="${GPU_DRIVER}"

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
    python3-full \
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
COPY --chown=invokeai:invokeai ./invokeai /home/invokeai/invokeai
COPY ./entrypoint.sh /home/invokeai/entrypoint.sh

USER invokeai
WORKDIR /home/invokeai

SHELL ["/bin/bash", "-c"]

RUN set -exu \
  && export DEBIAN_FRONTEND=noninteractive \
  && pipx install uv \
  && $HOME/.local/bin/uv venv --relocatable --prompt invoke --python 3.12 --python-preference only-managed .venv \
  && source .venv/bin/activate \
  && $HOME/.local/bin/uv pip install --upgrade "invokeai @ $HOME/invokeai" --python 3.12 --python-preference only-managed --torch-backend="${GPU_DRIVER}" --force-reinstall \
  && deactivate \
  && rm -rf $HOME/invokeai

ENTRYPOINT ["/bin/bash"]
CMD ["/home/invokeai/entrypoint.sh"]
