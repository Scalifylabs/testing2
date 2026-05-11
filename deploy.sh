#!/bin/sh
set -e

TARGET_DIR=$(pwd)

echo "[deploy.sh] Iniciando en: $TARGET_DIR"

# ── 1. Mover standalone a la raíz ─────────────────────────────────────────────
if [ -d "$TARGET_DIR/.next/standalone" ]; then
  echo "[deploy.sh] Moviendo standalone..."
  cp -r "$TARGET_DIR/.next/standalone/." "$TARGET_DIR/"
else
  echo "[deploy.sh] WARN: .next/standalone no encontrado. ¿El build fue standalone?"
fi

# ── 2. Asegurar assets estáticos en su lugar correcto ─────────────────────────
mkdir -p "$TARGET_DIR/.next/static"
if [ -d "$TARGET_DIR/.next/static" ]; then
  echo "[deploy.sh] Assets estáticos en su lugar."
fi

# ── 3. Limpieza agresiva de archivos fuente ───────────────────────────────────
echo "[deploy.sh] Limpiando archivos fuente..."
rm -rf \
  "$TARGET_DIR/src" \
  "$TARGET_DIR/app" \
  "$TARGET_DIR/pages" \
  "$TARGET_DIR/components" \
  "$TARGET_DIR/lib" \
  "$TARGET_DIR/styles" \
  "$TARGET_DIR/hooks" \
  "$TARGET_DIR/utils" \
  "$TARGET_DIR/types" \
  "$TARGET_DIR/prisma" \
  "$TARGET_DIR/.github" \
  "$TARGET_DIR/tsconfig.json" \
  "$TARGET_DIR/tsconfig.*.json" \
  "$TARGET_DIR/tailwind.config.js" \
  "$TARGET_DIR/tailwind.config.ts" \
  "$TARGET_DIR/postcss.config.js" \
  "$TARGET_DIR/postcss.config.mjs" \
  "$TARGET_DIR/next.config.js" \
  "$TARGET_DIR/next.config.ts" \
  "$TARGET_DIR/next.config.mjs" \
  "$TARGET_DIR/.eslintrc*" \
  "$TARGET_DIR/.prettierrc*" \
  "$TARGET_DIR/jest.config*" \
  "$TARGET_DIR/vitest.config*" \
  "$TARGET_DIR/README.md" \
  "$TARGET_DIR/CHANGELOG.md"

# ── 4. Crear app.js para Phusion Passenger si no existe ──────────────────────
if [ ! -f "$TARGET_DIR/app.js" ]; then
  echo "[deploy.sh] Creando app.js para Passenger..."
  printf "require('./server.js');\n" > "$TARGET_DIR/app.js"
fi

# ── 5. Reiniciar Passenger ────────────────────────────────────────────────────
echo "[deploy.sh] Reiniciando Passenger..."
mkdir -p "$TARGET_DIR/tmp"
touch "$TARGET_DIR/tmp/restart.txt"

echo "[deploy.sh] ✅ Despliegue completado."