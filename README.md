# 📁 PLANTILLA ESTÁNDAR DE PROYECTO

Esta carpeta es la **plantilla base** para cualquier proyecto nuevo.
Cópiala y renómbrala: `cp -r _plantilla_proyecto nuevo_proyecto`

---

## 📂 ESTRUCTURA

```
_plantilla_proyecto/
├── FICHA.md              # ← Ficha técnica (secreto, URLs, comandos)
├── README.md             # ← Qué es, cómo se usa, cómo se despliega
├── deploy.sh             # ← Script deploy (git push / rsync / scp / wrangler)
├── build.sh              # ← Script build (opcional: compila, minifica, renderiza)
├── render.sh             # ← Script render (para OpenSCAD, 3D, diagrams)
├── .gitignore            # ← Qué NO sube a git
├── src/                  # ← Código fuente / diseños / fuentes
│   └── .gitkeep
├── docs/                 # ← Docs, capturas, diagramas
│   └── .gitkeep
├── output/               # ← Generados (STL, PNG, HTML, APK, ZIP)
│   └── .gitkeep
└── secrets/              # ← SOLO EN LOCAL (NO SUBE A GIT)
    ├── .gitkeep
    └── README_SECRETS.md # ← Explica dónde están los secretos reales
```

---

## 🚀 CÓMO USARLA

```bash
# 1. Copia la plantilla
cp -r _plantilla_proyecto mi_nuevo_proyecto

# 2. Entra y personaliza
cd mi_nuevo_proyecto

# 3. Edita FICHA.md con tus datos reales
#    - URLs, secretos (dónde están), comandos, notas

# 4. Edita README.md con descripción del proyecto

# 5. Ajusta deploy.sh / build.sh / render.sh a tu flujo

# 6. Inicializa git (opcional)
git init
git add .
git commit -m "Init: plantilla proyecto"

# 7. ¡A trabajar en src/!
```

---

## ✅ CHECKLIST AL CREAR PROYECTO NUEVO

- [ ] Copiada plantilla y renombrada
- [ ] `FICHA.md` rellena (URLs, secretos-dónde, comandos)
- [ ] `README.md` con qué hace y cómo se usa
- [ ] `deploy.sh` funciona (prueba en seco)
- [ ] `build.sh` / `render.sh` ajustados
- [ ] `.gitignore` cubre output/, secrets/, *.log, *.tmp
- [ ] Carpeta `secrets/` creada localmente (no en git)
- [ ] Primer commit hecho
- [ ] Probado flujo completo: código → build → deploy → ver online

---

## 🔐 GESTIÓN DE SECRETOS (REGLA DE ORO)

> **NUNCA** pongas tokens, passwords, claves API en:
> - `FICHA.md` (solo dices *dónde* están: Bitwarden, Worker env, .env.local)
> - `deploy.sh` / `build.sh` (usa variables de entorno: `$GH_TOKEN`, `$CF_API_TOKEN`)
> - Código fuente (`src/`)

**SÍ:**
- `FICHA.md` dice: `GH_TOKEN → Bitwarden entrada "GitHub PAT (proyecto)"`
- `deploy.sh` usa: `git push https://$GH_TOKEN@github.com/user/repo.git`
- En local: `export GH_TOKEN=ghp_xxx` (o `.env.local` en `.gitignore`)
- En CI/CD / Worker: variable de entorno secreta del proveedor