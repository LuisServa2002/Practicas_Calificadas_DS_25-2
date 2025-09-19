#!/usr/bin/env bash
# Utilidades comunes

log() {
  printf '%s %s\n' "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" "$*"
}

cleanup() {
  log "Finalizando — cleanup (si aplica)."
}

# Captura de señales
trap "log 'SIGINT detectado, abortando'; exit 130" SIGINT
trap "log 'SIGTERM detectado, apagando'; exit 143" SIGTERM
