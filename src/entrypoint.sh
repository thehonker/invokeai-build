#!/bin/bash

echo "entrypoint.sh start"

echo "activating venv at ${HOME}/invokeai"

cd "${HOME}/invokeai/" || exit 1

. "${HOME}/venv/bin/activate"

echo "launching invokeai with args: $@"

exec python3 "${HOME}/invokeai/main.py" "$@"
