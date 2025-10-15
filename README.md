# invokeai-build

thehonker's builds of invokeai

## Usage

### Image

#### Latest nightly build

```none
ghcr.io/thehonker/invokeai:cpu-latest     # for cpu
ghcr.io/thehonker/invokeai:rocm6.3-latest # for amd
ghcr.io/thehonker/invokeai:cu126-latest   # for nvidia p40 and similar
ghcr.io/thehonker/invokeai:cu128-latest   # for modern nvidia
```

#### Upstream Git Tags

```none
ghcr.io/thehonker/invokeai:cpu-v6.8.0     # for cpu
ghcr.io/thehonker/invokeai:rocm6.3-v6.8.0 # for amd
ghcr.io/thehonker/invokeai:cu126-v6.8.0   # for nvidia p40 and similar
ghcr.io/thehonker/invokeai:cu128-v6.8.0   # for modern nvidia
```

### Storage

We do not set any configuration envvars ourselves.

This leads to InvokeAI storing data in `/home/invokeai/invokeai` by default.

You should mount persistent storage to this directory, ***OR*** set the env var `INVOKEAI_ROOT` and mount storage to that path.

### Configuration

All args to `/home/invokeai/entrypoint.sh` are passed to `invokeai-web`, as are all envvars.

See <https://invoke-ai.github.io/InvokeAI/configuration/> for details on configuration.
