#!/bin/bash
# render.sh — Render OpenSCAD / diagrams / 3D (ajusta a tu proyecto)
# Uso: ./render.sh [archivo.scad] [opciones...]
# Ejemplo: ./render.sh src/carcasa.scad --imgsize=1200,900 --viewall --autocenter --colorscheme=Metallic

set -e

cd "$(dirname "$0")"
PROYECTO="$(basename "$(pwd)")"

# OpenSCAD Nightly path (Windows)
OPENSCAD="/c/Program Files/OpenSCAD (Nightly)/openscad.exe"

echo "🎨 Render $PROYECTO"

# ===== AJUSTA ESTO A TU PROYECTO =====
# Ejemplos OpenSCAD:

# Render PNG vista diagonal
# "$OPENSCAD" -o output/modelo.png --imgsize=1200,900 --viewall --autocenter --colorscheme=Metallic src/modelo.scad

# Render STL para impresión
# "$OPENSCAD" -o output/modelo.stl src/modelo.scad

# Render múltiples vistas
# for view in front side top diag; do
#   "$OPENSCAD" -o output/modelo_${view}.png --imgsize=1200,900 --viewall --autocenter --colorscheme=Metallic --camera=$view src/modelo.scad
# done

# Diagramas Mermaid
# mmdc -i docs/diagrama.mmd -o output/diagrama.png

# ======================================

# Si se pasa archivo como argumento
if [ $# -gt 0 ]; then
    ARCHIVO="$1"
    shift
    if [ -f "$ARCHIVO" ]; then
        BASE=$(basename "$ARCHIVO" .scad)
        echo "📸 Renderizando $ARCHIVO → output/${BASE}.png"
        "$OPENSCAD" -o "output/${BASE}.png" --imgsize=1200,900 --viewall --autocenter --colorscheme=Metallic "$ARCHIVO" "$@"
        echo "✅ output/${BASE}.png listo"
    else
        echo "❌ Archivo no encontrado: $ARCHIVO"
        exit 1
    fi
else
    echo "⚠️  render.sh es plantilla: edita la sección 'AJUSTA ESTO' o pasa archivo.scad como argumento."
    echo "✅ Render simulado completado."
fi