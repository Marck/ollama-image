#!/bin/sh

log() { (>&2 echo "[$(date -Iseconds)] $0: $1"); }

if [ ! -d ${HOME}/.ollama/models ]; then
    log "no models found, copying default models..."
    mkdir -p ${HOME}/.ollama/models
    cp -r /models/* ${HOME}/.ollama/models/
fi

ollama $@