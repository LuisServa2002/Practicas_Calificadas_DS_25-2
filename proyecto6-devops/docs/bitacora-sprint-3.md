# Bitácora - Sprint 03

## Objetivos del Sprint
- Integrar todos los componentes desarrollados en los sprints previos.
- Implementar caché incremental en el Makefile.
- Garantizar idempotencia de tareas.
- Agregar trazabilidad de ejecuciones.
- Generar un paquete reproducible en `dist/`.

---

## Desarrollo

### 1. Preparación del entorno
Comandos y resultados:
```bash
make clean
>>> Limpieza completa.
make tools
>>> Todas las herramientas están disponibles.
make build
>>> Build inicial listo.
make test
>>> Resultados de pruebas guardados en out/bats_results_sprint3.txt
make run
>>> Configuración guardada en out/.config_env
>>> Evidencia de ejecución guardada en out/run_sprint3.txt
make trace
2025-09-19T21:36:16Z - Ejecutado release=v3.0, log=out/run_sprint3.txt
make package
>>> Paquete generado en dist/proyecto6-v3.0.tar.gz
```
Verificar cada archivo en cada carpeta , dicha estructura se encuentra detallada en el `README.md`.