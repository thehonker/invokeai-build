#!/bin/bash

echo "entrypoint.sh start"

echo "Ensuring ${HOME} exists, cd to it"
cd "${HOME}" || exit 1

echo "Activate venv at ${HOME}/.venv"
source "${HOME}/.venv/bin/activate"

echo "Launch InvokeAI with \"exec invokeai-web $@\""
exec invokeai-web "${@}"
