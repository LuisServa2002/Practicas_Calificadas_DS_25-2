#!/usr/bin/env bats

@test "curl devuelve 200 en google.com" {
  run curl -I -s -o /dev/null -w "%{http_code}" https://www.google.com
  [ "$status" -eq 0 ]
  [ "$output" -eq 200 ]
}
