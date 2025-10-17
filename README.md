# invokeai-build

thehonker's builds of invokeai

## Usage

### Image

#### Latest nightly build

[![InvokeAI - CPU - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cpu-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cpu-nightly.yml) \
`ghcr.io/thehonker/invokeai:cpu-latest`

[![InvokeAI - CUDA 12.6.x - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu126-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu126-nightly.yml) \
`ghcr.io/thehonker/invokeai:cu126-latest`

[![InvokeAI - CUDA 12.8.x - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu128-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu128-nightly.yml) \
`ghcr.io/thehonker/invokeai:cu128-latest`

[![InvokeAI - CUDA 13.0.x - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu130-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu130-nightly.yml) \
`ghcr.io/thehonker/invokeai:cu130-latest`

[![InvokeAI - ROCM 6.3 - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-rocm6.3-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-rocm6.3-nightly.yml) \
`ghcr.io/thehonker/invokeai:rocm6.3-latest`

[![InvokeAI - XPU - Nightly](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-xpu-nightly.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-xpu-nightly.yml) \
`ghcr.io/thehonker/invokeai:xpu-latest`

#### Upstream Git Tags

[![InvokeAI - CPU - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cpu-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cpu-stable.yml) \
`ghcr.io/thehonker/invokeai:cpu-stable`

[![InvokeAI - CUDA 12.6.x - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu126-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu126-stable.yml) \
`ghcr.io/thehonker/invokeai:cu126-stable`

[![InvokeAI - CUDA 12.8.x - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu128-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu128-stable.yml) \
`ghcr.io/thehonker/invokeai:cu128-stable`

[![InvokeAI - CUDA 13.0.x - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu130-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-cu130-stable.yml) \
`ghcr.io/thehonker/invokeai:cu130-stable`

[![InvokeAI - ROCM 6.3 - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-rocm6.3-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-rocm6.3-stable.yml) \
`ghcr.io/thehonker/invokeai:rocm6.3-stable`

[![InvokeAI - XPU - Stable](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-xpu-stable.yml/badge.svg)](https://github.com/thehonker/invokeai-build/actions/workflows/container-image-xpu-stable.yml) \
`ghcr.io/thehonker/invokeai:xpu-stable`

### Storage

We do not set any configuration envvars ourselves.

This leads to InvokeAI storing data in `/home/invokeai/invokeai` by default.

You should mount persistent storage to this directory, ***OR*** set the env var `INVOKEAI_ROOT` and mount storage to that path.

### Configuration

All args to `/entrypoint.sh` are passed to `invokeai-web`, as are all envvars.

See <https://invoke-ai.github.io/InvokeAI/configuration/> for details on configuration.
