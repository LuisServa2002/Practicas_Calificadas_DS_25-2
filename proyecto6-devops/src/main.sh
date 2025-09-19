#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${OUT_DIR:-out}"
mkdir -p "$OUT_DIR"

LOG_FILE="$OUT_DIR/run_sprint2.txt"
exec > >(tee -a "$LOG_FILE") 2>&1

: "${PORT:?Variable PORT no definida}"
: "${MESSAGE:?Variable MESSAGE no definida}"
: "${RELEASE:?Variable RELEASE no definida}"
: "${DNS_SERVER:?Variable DNS_SERVER no definida}"

# Importar librerías
source src/lib/utils.sh
source src/lib/http.sh
source src/lib/dns.sh

trap cleanup EXIT

log "INICIO: Configurador automático (Sprint 03) - release=$RELEASE"
log "Configuración actual: PORT=$PORT MESSAGE=\"$MESSAGE\" RELEASE=$RELEASE DNS_SERVER=$DNS_SERVER"

if test_http && test_dns; then
  log "RESULTADO: Chequeos OK"
  exit 0
else
  log "RESULTADO: Falló uno o más chequeos"
  exit 1
fi
