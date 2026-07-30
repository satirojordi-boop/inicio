#!/bin/bash
# build.sh — Build genérico (ajusta a tu proyecto)
# Uso: ./build.sh
# Compila, minifica, transpila, empaqueta según tu stack

set -e

cd "$(dirname "$0")"
PROYECTO="$(basename "$(pwd)")"

echo "🔨 Build $PROYECTO"

# ===== AJUSTA ESTO A TU PROYECTO =====
# Ejemplos comunes:

# Node / Frontend
# npm ci
# npm run build
# output en dist/ o build/

# Python
# pip install -r requirements.txt
# python -m build
# output en dist/

# Go
# go build -o output/bin ./cmd/...

# Rust
# cargo build --release
# cp target/release/bin output/

# Android (Gradle)
# ./gradlew assembleRelease
# cp app/build/outputs/apk/release/*.apk output/

# OpenSCAD (render a PNG/STL)
# openscad -o output/modelo.png --imgsize=1200,900 --viewall --autocenter --colorscheme=Metallic src/modelo.scad

# Diagramas (Mermaid / PlantUML)
# mmdc -i docs/diagrama.mmd -o output/diagrama.png

# ======================================

# Por defecto: solo avisa
echo "⚠️  build.sh es plantilla: edita la sección 'AJUSTA ESTO' y descomenta lo que uses."
echo "✅ Build simulado completado."