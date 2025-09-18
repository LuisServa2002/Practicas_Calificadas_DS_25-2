#!/usr/bin/env bash
# Validación HTTP

test_http() {
  log ">>> Verificando HTTP (curl)..."
  result=$(curl -I --max-time 5 -s -w "%{http_code} %{time_total}\n" -o /dev/null https://www.google.com || echo "000 0")
  code=$(echo "$result" | awk '{print $1}')
  time=$(echo "$result" | awk '{print $2}')
  log "HTTP status=$code tiempo=${time}s"

  if [ "$code" -ne 200 ]; then
    log "ERROR: HTTP no respondió 200"
    return 2
  fi

  # threshold: tiempo de respuesta < 2s
  if (( $(echo "$time > 2" | bc -l) )); then
    log "ADVERTENCIA: HTTP lento (>${time}s)"
  fi

  return 0
}
