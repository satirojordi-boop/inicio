#!/usr/bin/env bash
# deploy.sh — Sube mi_web a GitHub Pages
# Uso: ./deploy.sh

set -euo pipefail

cd "$(dirname "$0")"

echo "🚀 Desplegando mi_web a GitHub Pages..."

# Archivos a desplegar
ARCHIVOS="index.html sitios.json"

# Verifica que existan
for f in $ARCHIVOS; do
    [ -f "$f" ] || { echo "❌ Falta $f"; exit 1; }
done

# Git add + commit + push
git add $ARCHIVOS
git commit -m "Deploy mi_web: $(date '+%Y-%m-%d %H:%M')" || {
    echo "ℹ️  Sin cambios nuevos (commit vacío)."
}
git push origin main

echo ""
echo "✅ Push completado a GitHub."
echo "⏳ GitHub Pages reconstruye en 1-2 minutos."
echo "🌐 https://satirojordi-boop.github.io/inicio/"
echo ""
echo "💡 Fuerza recarga: Ctrl+Shift+R o abre en incógnito"