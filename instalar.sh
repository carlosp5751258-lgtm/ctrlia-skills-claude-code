#!/usr/bin/env bash
# Instala las skills gratis de Ctrl+IA en Claude Code.
#   bash instalar.sh            -> ./.claude/skills  (proyecto actual)
#   bash instalar.sh --global   -> ~/.claude/skills  (todos tus proyectos)
# Nunca sobrescribe archivos existentes: si ya existe, lo omite y te avisa.
set -euo pipefail
ORIG="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
case "${1:-}" in
  --global) DEST="$HOME/.claude/skills" ;;
  "")       DEST="$(pwd)/.claude/skills" ;;
  *) echo "Opción desconocida: $1 (usa --global o nada)" >&2; exit 1 ;;
esac
mkdir -p "$DEST"; n=0
for dir in "$ORIG"/*/; do
  nombre="$(basename "$dir")"
  if [ -e "$DEST/$nombre" ]; then echo "  = omitido (ya existe): $DEST/$nombre"; else cp -r "$dir" "$DEST/$nombre"; echo "  + instalado: $nombre"; n=$((n + 1)); fi
done
echo "Listo: $n skill(s) instalada(s) en $DEST. Reinicia Claude Code para usarlas."
