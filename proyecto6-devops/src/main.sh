#!/usr/bin/env bash
set -euo pipefail

# Carpeta de salida (configurable)
OUT_DIR="${OUT_DIR:-out}"
mkdir -p "$OUT_DIR"

# Archivo de log principal (se duplica a pantalla y a archivo)
LOG_FILE="$OUT_DIR/run_sprint1.txt"
# redirigir stdout+stderr a tee para guardar evidencia automáticamente
exec > >(tee -a "$LOG_FILE") 2>&1

# Validar que existan las variables necesarias
: "${PORT:?Variable PORT no definida}"
: "${MESSAGE:?Variable MESSAGE no definida}"
: "${RELEASE:?Variable RELEASE no definida}"
: "${DNS_SERVER:?Variable DNS_SERVER no definida}"

log() {
  printf '%s %s\n' "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" "$*"
}

cleanup() {
  log "Finalizando — cleanup (si aplica)."
}
trap cleanup EXIT

log "INICIO: Configurador automático - release=$RELEASE"
log "Configuración actual: PORT=$PORT MESSAGE=\"$MESSAGE\" RELEASE=$RELEASE DNS_SERVER=$DNS_SERVER"

test_http() {
  log ">>> Verificando HTTP (curl)..."
  # timeout para evitar bloqueos largos
  http_code=$(curl -I --max-time 10 -s -o /dev/null -w "%{http_code}" https://www.google.com || echo "000")
  log "HTTP status: $http_code"
  if [ "$http_code" -ne 200 ]; then
    log "ERROR: HTTP check falló (código $http_code)"
    return 2
  fi
  return 0
}

test_dns() {
  log ">>> Verificando DNS (dig)..."
  # obtener respuesta resumida (A / CNAME). +noall +answer evita otra salida ruidosa.
  dns_out=$(dig @"$DNS_SERVER" www.google.com +noall +answer || true)
  if [ -z "$dns_out" ]; then
    log "ERROR: dig no devolvió respuesta desde $DNS_SERVER"
    return 3
  fi
  log "dig returned:"
  printf '%s\n' "$dns_out"
  return 0
}

# Flujo principal
if test_http && test_dns; then
  log "RESULTADO: Chequeos OK"
  exit 0
else
  log "RESULTADO: Falló uno o más chequeos"
  exit 1
fi
