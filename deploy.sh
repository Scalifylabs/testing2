#!/bin/sh
set -e

# Mover archivos del standalone build
if [ -d ".next/standalone" ]; then
    cp -r .next/standalone/. .
    cp -r .next/static/. .next/static/ 2>/dev/null || true
    cp -r public/. ./public/ 2>/dev/null || true
fi

# Crear app.js para Passenger si no existe
if [ ! -f "app.js" ]; then
    printf "const path = require('path');\nrequire(path.resolve(__dirname, './server.js'));\n" > app.js
fi

# Reiniciar Passenger
mkdir -p tmp
touch tmp/restart.txt