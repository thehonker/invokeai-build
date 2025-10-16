#!/bin/bash

set -exu

export GPU_DRIVER=$1

export DEBIAN_FRONTEND=noninteractive

pipx install uv

$HOME/.local/bin/uv venv --relocatable --prompt invoke --python 3.12 --python-preference only-managed .venv

. .venv/bin/activate
$HOME/.local/bin/uv pip install --upgrade "invokeai @ $HOME/invokeai" --python 3.12 --python-preference only-managed --torch-backend=$GPU_DRIVER --force-reinstall
deactivate

rm -rf $HOME/invokeai
rm /install-invokeai.sh
