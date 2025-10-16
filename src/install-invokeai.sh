#!/bin/bash

set -exu

cd $HOME || exit 1

export GPU_DRIVER=$1

export DEBIAN_FRONTEND=noninteractive

TORCH_PIP_PRE=""

case $GPU_DRIVER in
  cu126)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/cu126
    ;;
  cu128)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/cu128
    ;;
  cu130)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/nightly/cu130
    ;;
  rocm6.3)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/rocm6.3
    ;;
  rocm7.0)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/nightly/rocm7.0
    TORCH_PIP_PRE="--pre"
    ;;
  xpu)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/xpu
    ;;
  cpu)
    TORCH_INDEX_URL=https://download.pytorch.org/whl/cpu
    ;;
  *)
    echo "Unsupported GPU driver: $GPU_DRIVER"
    exit 1
    ;;
esac

pipx install uv

export PATH="$HOME/.local/bin:$PATH"

uv venv --relocatable --prompt invokeai --python 3.12 --python-preference only-managed $HOME/.venv

. $HOME/.venv/bin/activate

uv pip install \
  $TORCH_PIP_PRE \
  --torch-backend "${GPU_DRIVER}" \
  "$HOME/invokeai-source"

deactivate

rm -rf $HOME/invokeai-source
