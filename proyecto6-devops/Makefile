# Makefile Proyecto 6 - Sprint 2

.PHONY: tools build test run clean package help

tools:
	@command -v bash >/dev/null || (echo "Falta bash" && exit 1)
	@command -v curl >/dev/null || (echo "Falta curl" && exit 1)
	@command -v dig >/dev/null || (echo "Falta dig" && exit 1)
	@command -v bats >/dev/null || (echo "Falta bats" && exit 1)
	@echo ">>> Todas las herramientas están disponibles."

build:
	@mkdir -p out
	@echo ">>> Build inicial listo."

test:
	@bats tests/

run:
	@bash src/main.sh

clean:
	@rm -rf out dist
	@echo ">>> Limpieza completa."

package:
	@mkdir -p dist
	@test -n "$(RELEASE)" || (echo "ERROR: variable RELEASE no definida" && exit 1)
	@tar -czf dist/proyecto6-$(RELEASE).tar.gz src/ tests/ Makefile docs/
	@echo ">>> Paquete generado en dist/proyecto6-$(RELEASE).tar.gz"

help:
	@echo "Targets disponibles:"
	@echo "  tools    - Verifica dependencias"
	@echo "  build    - Prepara directorios intermedios"
	@echo "  test     - Ejecuta pruebas con Bats"
	@echo "  run      - Corre el flujo principal"
	@echo "  clean    - Limpia artefactos"
	@echo "  package  - Empaqueta el toolkit en dist/"
