#!/usr/bin/env bash
# Validación DNS

test_dns() {
  log ">>> Verificando DNS (dig)..."
  records=$(dig @"$DNS_SERVER" www.google.com +noall +answer || true)

  if [ -z "$records" ]; then
    log "ERROR: DNS no devolvió respuesta"
    return 3
  fi

  log "dig returned:"
  echo "$records" | awk '{print "→", $1, $4, $5}'
  return 0
}
