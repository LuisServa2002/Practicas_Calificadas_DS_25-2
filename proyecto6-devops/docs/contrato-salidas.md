# Contrato de Salidas – Sprint 01

Este documento define los **archivos generados en el Sprint 01**, su formato y cómo validarlos.

---

## Carpeta `out/`
- **`run_sprint1.txt`**
  - **Formato:** log en texto plano.
  - **Contenido:** ejecución del `main.sh` con configuración inicial y resultados HTTP/DNS.
  - **Validación:** debe contener:
    - `HTTP status: 200`
    - `dig returned:` seguido de al menos una dirección IP.

- **`bats_results.txt`**
  - **Formato:** reporte de pruebas **Bats**.
  - **Contenido:** salida de la ejecución de pruebas (`ok`/`not ok`).
  - **Validación:** todos los casos deben mostrar `ok`.

---

## Carpeta `dist/`
*(En Sprint 01 no se generan paquetes, solo código y pruebas.)*

---

## Resumen
En el Sprint 01 se generan principalmente **logs de ejecución** (`out/`) y **resultados de pruebas Bats**.
Estos artefactos sirven como evidencia mínima de la configuración inicial y validación de HTTP/DNS.


# Contrato de Salidas – Sprint 02

Este documento define los **archivos generados en el Sprint 02**, su formato y cómo validarlos.

---

## Carpeta `out/`
- **`run_sprint2.txt`**
  - **Formato:** log en texto plano.
  - **Contenido:** ejecución completa de `main.sh` (con timestamp, configuración, resultados HTTP/DNS, métricas y limpieza).
  - **Validación:**
    - Debe contener `HTTP status=200`.
    - Debe contener al menos una línea `dig returned:` con registros A o CNAME.
    - En caso de lentitud, puede mostrar advertencia: `ADVERTENCIA: HTTP lento`.

- **`bats_results_sprint2.txt`**
  - **Formato:** reporte de pruebas **Bats**.
  - **Contenido:** lista de casos (ok/fail).
  - **Validación:** 
    - Ejemplo esperado:
      ```bash
      1..4
      ok 1 curl devuelve 200 en google.com
      ok 2 dig devuelve registros para google.com
      ok 3 log imprime mensaje con timestamp
      ok 4 trap maneja SIGINT correctamente
      ```
    - Todos los casos deben ser `ok`.

---

## Carpeta `dist/`
- **`proyecto6-v0.2.tar.gz`**
  - **Formato:** archivo comprimido `.tar.gz`.
  - **Contenido:** código fuente (`src/`), pruebas (`tests/`), documentación (`docs/`), Makefile.
  - **Validación:**
    ```bash
    tar -tzf dist/proyecto6-v0.2.tar.gz | head
    ```
    Debe listar al menos:
    - `src/main.sh`
    - `src/lib/http.sh`
    - `src/lib/dns.sh`
    - `src/lib/utils.sh`
    - `tests/`
    - `docs/`
    - `Makefile`
---

## Resumen
En el Sprint 02 se generaron:  
- **Logs detallados** (`out/`)  
- **Resultados de pruebas Bats**  
- **Empaquetado** (`dist/proyecto6-v0.2.tar.gz`)  
 
Estos elementos garantizan que el toolkit es **modular, probado y distribuible**.

# Contrato de Salidas - Sprint 03

## Archivos generados

### 1. Resultados de pruebas
- **Ubicación:** `out/bats_results_sprint3.txt`
- **Formato:** texto plano con resultados Bats.
- **Validación:** verificar que todas las pruebas estén en estado `ok`.

### 2. Evidencia de ejecución
- **Ubicación:** `out/run_sprint3.txt`
- **Formato:** log con timestamp y resultados de HTTP/DNS.
- **Validación:** revisar que aparezca `RESULTADO: Chequeos OK`.

### 3. Trazabilidad
- **Ubicación:** `out/trace.log`
- **Formato:** texto plano acumulativo.
- **Contenido:** fecha, release y archivo de log asociado.
- **Validación:** cada nueva ejecución agrega una línea.

### 4. Paquete reproducible
- **Ubicación:** `dist/proyecto6-<versión>.tar.gz`
- **Formato:** archivo comprimido `.tar.gz`
- **Contenido:** `src/`, `tests/`, `docs/`, `Makefile`, `out/`.
- **Validación:**
  ```bash
  tar -tzf dist/proyecto6-<versión>.tar.gz | head