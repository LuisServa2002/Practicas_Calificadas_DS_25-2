# Bitácora – Sprint 02

## Objetivos del Sprint
- Modularizar el script en librerías (`src/lib/`).  
- Implementar Bash robusto (errores, trap, limpieza).  
- Agregar señales de proceso (`SIGINT`, `SIGTERM`).  
- Incluir métricas simples (tiempo de respuesta HTTP).  
- Ampliar pruebas con **Bats** (casos felices y fallidos).  
- Generar artefactos empaquetados en `dist/`.  

---

## Desarrollo y Ejecuciones

### 1. Variables de entorno
Previamente debemos darle permisos mediante `chmod +x src/main.sh`
```bash
export PORT=8080
export MESSAGE="Sprint2 listo"
export RELEASE="v0.2"
export DNS_SERVER=8.8.8.8
```
### 2. Ejecutamos el comando `make run`.
```
%sn2025-09-18T15:16:06ZINICIO: Configurador automático (Sprint 2) - release=v1.0%sn2025-09-18T15:16:06ZConfiguración actual: PORT=8080 MESSAGE="Sprint 02 listo" RELEASE=v1.0 DNS_SERVER=8.8.8.8%sn2025-09-18T15:16:06Z>>> Verificando HTTP (curl)...%sn2025-09-18T15:16:06ZHTTP status: 200%sn2025-09-18T15:16:06Z>>> Verificando DNS (dig)...%sn2025-09-18T15:16:07Zdig returned:www.google.com.		86	IN	A	64.233.186.104
www.google.com.		86	IN	A	64.233.186.106
www.google.com.		86	IN	A	64.233.186.99
www.google.com.		86	IN	A	64.233.186.105
www.google.com.		86	IN	A	64.233.186.103
www.google.com.		86	IN	A	64.233.186.147n%sn2025-09-18T15:16:07ZRESULTADO: Chequeos OK%sn2025-09-18T15:16:07ZFinalizando — cleanup (si aplica).
```

### 3. Ejecución de pruebas Bats
Mediante el comando `bats tests/ | tee out/bats_results_sprint2.txt` ó `make test`. Obtenemos la siguiente salida:

```
1..4
ok 1 dig devuelve al menos un registro para google.com usando 8.8.8.8
ok 2 curl devuelve 200 en google.com
ok 3 log imprime mensaje con timestamp
not ok 4 trap maneja SIGINT
# (in test file tests/utils_test.bats, line 12)
#   `run bash -c "source ../src/lib/utils.sh; kill -s INT $$"' failed with status 130
```
### 4. Empaquetado con Makefile
Mediante el comando `make package` se realiza el empaquetado que se genera en la carpeta `/dist`.



