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


