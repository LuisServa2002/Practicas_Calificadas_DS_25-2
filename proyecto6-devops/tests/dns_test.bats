#!/usr/bin/env bats

@test "dig devuelve al menos un registro para google.com usando 8.8.8.8" {
  run dig @8.8.8.8 www.google.com +noall +answer
  [ "$status" -eq 0 ]
  [[ -n "$output" ]]
}
