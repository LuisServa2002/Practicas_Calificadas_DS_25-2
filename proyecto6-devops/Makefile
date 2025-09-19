# Makefile Proyecto 6 - Sprint 03
# Incluye caché incremental, idempotencia, trazabilidad y paquete reproducible

OUT_DIR = out
DIST_DIR = dist
RUN_LOG = $(OUT_DIR)/run_sprint3.txt
TEST_LOG = $(OUT_DIR)/bats_results_sprint3.txt
CONFIG = $(OUT_DIR)/.config_env
TRACE_LOG = $(OUT_DIR)/trace.log
PACKAGE = $(DIST_DIR)/proyecto6-$(RELEASE).tar.gz

.PHONY: tools build clean help trace

tools:
	@command -v bash >/dev/null || (echo "Falta bash" && exit 1)
	@command -v curl >/dev/null || (echo "Falta curl" && exit 1)
	@command -v dig >/dev/null || (echo "Falta dig" && exit 1)
	@command -v bats >/dev/null || (echo "Falta bats" && exit 1)
	@echo ">>> Todas las herramientas están disponibles."

build:
	@mkdir -p $(OUT_DIR)
	@echo ">>> Build inicial listo."

# Guardamos la configuración actual para detectar cambios de variables
$(CONFIG):
	@mkdir -p $(OUT_DIR)
	@echo "PORT=$(PORT)" > $@
	@echo "MESSAGE=$(MESSAGE)" >> $@
	@echo "RELEASE=$(RELEASE)" >> $@
	@echo "DNS_SERVER=$(DNS_SERVER)" >> $@
	@echo ">>> Configuración guardada en $@"

# Pruebas automáticas
$(TEST_LOG): tests/*.bats
	@mkdir -p $(OUT_DIR)
	@bats tests/ | tee $@
	@echo ">>> Resultados de pruebas guardados en $@"

test: $(TEST_LOG)

# Ejecución principal con dependencia de config y código
$(RUN_LOG): $(CONFIG) src/main.sh src/lib/*.sh
	@mkdir -p $(OUT_DIR)
	@bash src/main.sh > $@ 2>&1 || true
	@echo ">>> Evidencia de ejecución guardada en $@"
	@echo "$$(date -u +"%Y-%m-%dT%H:%M:%SZ") - Ejecutado release=$(RELEASE), log=$@" >> $(TRACE_LOG)

run: $(RUN_LOG)

# Ver trazabilidad (historial de ejecuciones)
trace:
	@cat $(TRACE_LOG) || echo "No hay trazas registradas aún."

# Limpieza de artefactos
clean:
	@rm -rf $(OUT_DIR) $(DIST_DIR)
	@echo ">>> Limpieza completa."

# Paquete reproducible en dist/
$(PACKAGE): $(RUN_LOG) $(TEST_LOG) src/ tests/ Makefile docs/
	@test -n "$(RELEASE)" || (echo "ERROR: variable RELEASE no definida" && exit 1)
	@mkdir -p $(DIST_DIR)
	@tar -czf $@ src/ tests/ Makefile docs/ $(OUT_DIR)/
	@echo ">>> Paquete generado en $@"

package: $(PACKAGE)

help:
	@echo "Targets disponibles:"
	@echo "  tools    - Verifica dependencias"
	@echo "  build    - Prepara directorios intermedios"
	@echo "  test     - Ejecuta pruebas con Bats"
	@echo "  run      - Corre el flujo principal (idempotente)"
	@echo "  trace    - Muestra historial de ejecuciones"
	@echo "  clean    - Limpia artefactos"
	@echo "  package  - Empaqueta el proyecto en dist/"
