# Bitácora - Sprint 01
## Objetivos del Sprint
- Implementar un script en Bash (`main.sh`) que valide variables de entorno y realice pruebas de conectividad HTTP/DNS.
- Crear pruebas automáticas con **Bats**.
- Construir un **Makefile** con targets básicos.
- Documentar y generar evidencias de ejecución.

---

## Desarrollo y ejecución

### 1. Configuración de variables de entorno
Comandos ejecutados:
Previamente debemos darle permisos mediante `chmod +x src/main.sh`
```bash
export PORT=8080
export MESSAGE="Sprint1 listo"
export RELEASE="v0.1"
export DNS_SERVER=8.8.8.8
```

Se uso `8.8.8.8` (Google DNS) por ser confiable y accesible.

### 2. Ejecución del script principal
Comando: `make run` . Lo cual generará el .txt en la carpeta de `out/`.

Además tendremos la siguiente salida:
```
>>> Configuración actual:
PORT=8080
MESSAGE=Sprint1 listo
RELEASE=v0.1
DNS_SERVER=8.8.8.8
>>> Verificando HTTP...
200
>>> Verificando DNS...
```
Se guarda la salida como evidencia en `out/run_sprint1.txt`.

### 3. Ejecución de pruebas automáticas (Bats)

Utilizamos el comando : `bats tests/ | tee out/bats_results.txt` ó `make test`.

La salida será la siguiente:
```
1..2
ok 1 dig devuelve al menos un registro para google.com usando 8.8.8.8
ok 2 curl devuelve 200 en google.com
```

### 4. Ejecución del Makefile
- `make tools` → todas las herramientas disponibles. 

- `make build` → carpeta `out/` creada.

- `make run` → ejecuta `main.sh`.

- `make test` → pruebas Bats correctas.

- `make clean` → limpia `out/` y `dist/`.

