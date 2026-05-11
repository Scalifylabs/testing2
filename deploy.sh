#!/bin/bash

# 1. Detectar la ruta actual automáticamente
# Esto hace que el script funcione sin importar el dominio
TARGET_DIR=$(pwd)
echo "Ejecutando limpieza en: $TARGET_DIR"

# 2. Verificar que estamos en un entorno Next.js builded
if [ ! -d ".next/standalone" ]; then
    echo "Error: .next/standalone no encontrado. Abortando limpieza."
    exit 1
fi

# 3. Mover archivos del standalone a la raíz
# Usamos '.' para referenciar el directorio actual
cp -rv .next/standalone/. ./
cp -rv .next/static/. .next/standalone/.next/static/

# 4. Limpieza Atómica (Mantiene solo el Runtime)
# Borra todo excepto lo estrictamente necesario para que node server.js funcione
find . -maxdepth 1 ! -name '.' ! -name '..' \
    ! -name 'node_modules' \
    ! -name '.next' \
    ! -name 'public' \
    ! -name 'server.js' \
    ! -name 'package.json' \
    ! -name 'deploy.sh' \
    ! -name 'tmp' \
    -exec rm -rf {} +

# 5. Reinicio de Passenger (Plesk)
mkdir -p tmp
touch tmp/restart.txt

echo "Despliegue universal completado con éxito."