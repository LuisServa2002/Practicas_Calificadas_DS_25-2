#!/usr/bin/env bats

@test "log imprime mensaje con timestamp" {
  run bash -c "source src/lib/utils.sh; log 'Prueba de log'"
  [[ "$output" == *"Prueba de log"* ]]
}

@test "trap maneja SIGINT ejecuta cleanup" {
  run bash -c "source src/lib/utils.sh; cleanup"
  [[ "$output" == *"Finalizando"* ]]
}
