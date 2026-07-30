#!/usr/bin/env bash
# build.sh — Verifica y prepara mi_web (web estática)
# Uso: ./build.sh

set -euo pipefail

cd "$(dirname "$0")"

echo "🔨 Verificando mi_web..."

# 1. Archivos obligatorios
for f in index.html sitios.json; do
    [ -f "$f" ] || { echo "❌ Falta $f"; exit 1; }
    echo "✅ $f existe"
done

# 2. index.html válido
if head -n 1 index.html | grep -q '<!DOCTYPE html>'; then
    echo "✅ index.html tiene DOCTYPE válido"
else
    echo "⚠️  index.html no parece HTML válido"
fi

# 3. sitios.json válido
if python -c "import json,sys; json.load(open('sitios.json'))" 2>/dev/null; then
    COUNT=$(python -c "import json; print(len(json.load(open('sitios.json'))))")
    echo "✅ sitios.json válido ($COUNT accesos)"
else
    echo "❌ sitios.json NO es JSON válido"
    exit 1
fi

# 4. deploy.sh ejecutable
[ -x deploy.sh ] && echo "✅ deploy.sh ejecutable" || echo "⚠️  deploy.sh no ejecutable (chmod +x deploy.sh)"

echo ""
echo "✅ Build verificado. Todo listo para ./deploy.sh"