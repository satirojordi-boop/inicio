#!/bin/bash
# deploy.sh — Deploy genérico (ajusta a tu proyecto)
# Uso: ./deploy.sh
# Por defecto: git add/commit/push → GitHub Pages / Netlify / Vercel / servidor

set -e

cd "$(dirname "$0")"
PROYECTO="$(basename "$(pwd)")"

echo "🚀 Deploy $PROYECTO"

# ===== AJUSTA ESTO A TU PROYECTO =====
# Opción A: GitHub Pages / Netlify / Vercel (git push)
# git add -A
# git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M')"
# git push origin main

# Opción B: rsync a servidor
# rsync -avz --delete output/ user@server:/var/www/proyecto/

# Opción C: scp a Raspberry / VPS
# scp -r output/* user@ip:/ruta/

# Opción D: wrangler deploy (Cloudflare Workers/Pages)
# wrangler deploy

# Opción E: curl a webhook / API
# curl -X POST -H "Authorization: Bearer $DEPLOY_TOKEN" ...

# ======================================

# Por defecto: git push (descomenta y ajusta)
# git add -A
# git commit -m "Deploy $PROYECTO: $(date '+%Y-%m-%d %H:%M')"
# git push origin main

echo "⚠️  deploy.sh es plantilla: edita la sección 'AJUSTA ESTO' y descomenta lo que uses."
echo "✅ Hecho (simulado)."