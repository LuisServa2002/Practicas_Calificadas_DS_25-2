# Proyecto 6 (Configurador automático de entornos DevOps)
# Sprint 01
En el **Sprint 01** se desarrolla el primer prototipo con:  
- Un script en Bash (`src/main.sh`) que valida variables y ejecuta pruebas de conectividad HTTP/DNS.  
- Pruebas automáticas con **Bats**.  
- Automatización mediante **Makefile**.  
- Evidencias guardadas en la carpeta `out/`.  
- Documentación y bitácora en `docs/`.
## Estructura del proyecto (Sprint 01)
```plaintext
proyecto6-devops/
│── src/
│   └── main.sh              # Script principal en Bash
│
│── tests/
│   └── http_test.bats
|   └── dns_test.bats 
│
│── docs/
│   ├── README.md            
│   └── bitacora-sprint-1.md # Evidencias de Sprint 1
│
│── out/                     # Salidas intermedias
│
│── Makefile                 # Automatización básica
```

Realizamos la configuración de las siguientes variables:

|Variable|Función|Ejemplo|
|--------|-------|-------|
|`PORT` |Puerto donde se ejecutara servicios|8080|
|`MESSAGE` |Mensaje mostrado por el script|"Sprint1 listo"|
|`RELEASE` |Versión del release actual|v0.1|
|`DNS_SERVER`|Servidor DNS usado para pruebas|8.8.8.8|

# Sprint 02

En el **Sprint 02** se evolucionó el prototipo inicial hacia un **toolkit modular en Bash**, con librerías reutilizables, pruebas más completas y un sistema de empaquetado de entregables.

---

## Estructura del proyecto (Sprint 02)

```plaintext
proyecto6-devops/
├── dist/                # Artefactos finales (.tar.gz)
├── docs/                # Documentación y bitácoras
│   |── bitacora-sprint-1.md
│   ├── bitacora-sprint-2.md      
|   ├── contrato-salidas.md    
│   └── README.md
├── out/                 # Logs y resultados de pruebas
├── src/
│   ├── main.sh          # Script principal (orquestador)
│   └── lib/             # Toolkit de librerías Bash
│       ├── http.sh
│       ├── dns.sh
│       └── utils.sh
├── tests/               # Pruebas automatizadas con Bats
│   ├── http_test.bats
│   ├── dns_test.bats
│   └── utils_test.bats
└── Makefile
```
En este sprint agregamos una nueva variable de entorno `make package` que se encarga del empaquetado del release creando la carpeta `dist/` y simplificamos el código de `main.sh` dividiendo dichos códigos en la carpeta `lib/` para que sea un orquestador.

# Sprint 03
En el **Sprint 03** realizamos la integración final del proyecto, aplicando:

- **Caché incremental en Makefile** → evita repetir tareas si los archivos no cambiaron.
- **Idempotencia** → ejecutar varias veces los mismos targets no genera cambios innecesarios.
- **Trazabilidad** → historial de ejecuciones registrado en `out/trace.log` , gracias al target creado `trace`.
- **Paquete reproducible** → generación de artefactos comprimidos en `dist/`.

## Estructura del proyecto (Sprint 03)
```plaintext
proyecto6-devops/
├── dist/                          # Paquetes comprimidos (artefactos entregables)
│   └── proyecto6-v3.0.tar.gz
│
├── docs/                          # Documentación
│   ├── README.md                  # Descripción general del sprint
│   ├── bitacora-sprint-1.md       # Bitácora Sprint 01
│   ├── bitacora-sprint-2.md       # Bitácora Sprint 02
│   ├── bitacora-sprint-3.md       # Bitácora Sprint 03
│   ├── contrato-salidas.md        # Contrato de salidas (artefactos y validación)
│   
├── out/                   
│   ├── bats_results_sprint3.txt   # Resultados de pruebas Bats
│   ├── run_sprint3.txt            # Evidencia de ejecución
│   ├── trace.log                  # Historial de ejecuciones (trazabilidad)
│
├── src/                           # Código fuente
│   ├── main.sh                    # Script principal con logs, traps y métricas
│   └── lib/                       # Librerías auxiliares
│       ├── http.sh                # Funciones de chequeo HTTP
│       ├── dns.sh                 # Funciones de chequeo DNS
│       └── utils.sh               # Funciones utilitarias (log, traps, cleanup)
│
├── tests/                         # Pruebas automáticas con Bats
│   ├── http_test.bats             # Valida chequeo HTTP
│   ├── dns_test.bats              # Valida chequeo DNS
│   └── utils_test.bats            # Valida log y manejo de señales
│
├── Makefile                       # Automatización: build, test, run, package, trace
```
