# Proyecto 6 (Configurador automático de entornos DevOps) Sprint 01
En el **Sprint 01** se desarrolla el primer prototipo con:  
- Un script en Bash (`src/main.sh`) que valida variables y ejecuta pruebas de conectividad HTTP/DNS.  
- Pruebas automáticas con **Bats**.  
- Automatización mediante **Makefile**.  
- Evidencias guardadas en la carpeta `out/`.  
- Documentación y bitácora en `docs/`.  

Realizamos la configuración de las siguientes variables:

|Variable|Función|Ejemplo|
|--------|-------|-------|
|`PORT` |Puerto donde se ejecutara servicios|8080|
|`MESSAGE` |Mensaje mostrado por el script|"Sprint1 listo"|
|`RELEASE` |Versión del release actual|v0.1|
|`DNS_SERVER`|Servidor DNS usado para pruebas|8.8.8.8|

## Ejecución
Antes de la ejecución es necesario instalar las **dependencias**:
### Dependencias
- Bash
- Curl
- Dig (dnsutils)
- Bats (para pruebas)
  
1. Exportar variables:
   ```bash
   export PORT=8080
   export MESSAGE="Sprint1 listo"
   export RELEASE="v0.1"
   export DNS_SERVER=8.8.8.8
   ```
2. Usar el Makefile:
   ```makefile
   make tools   # verifica dependencias
   make build   # prepara carpeta out/
   make run     # ejecuta main.sh
   make test    # corre pruebas Bats
   make clean   # limpia artefactos
   ```


