#!/bin/bash

echo "entrypoint.sh start"

echo "activating venv at ${HOME}/invokeai"

cd "${HOME}" || exit 1

source "${HOME}/venv/bin/activate"

echo "launching invokeai with args: $@"

exec invokeai-web "${@}"
