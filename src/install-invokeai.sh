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

python3 -m venv --prompt invokeai $HOME/.venv

. $HOME/.venv/bin/activate

python3 -m pip install \
  pip \
  setuptools \
  wheel

python3 -m pip install \
  $TORCH_PIP_PRE \
  --index-url "${TORCH_INDEX_URL}" \
  "$HOME/invokeai-source"

deactivate

rm -rf $HOME/invokeai-source
