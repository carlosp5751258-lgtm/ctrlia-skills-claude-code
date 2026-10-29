---
name: changelog-release
description: Prepara una release con versionado semántico (SemVer) y actualiza CHANGELOG.md siguiendo Keep a Changelog, a partir del historial de git y los commits convencionales. Úsala cuando el usuario pida "prepara la release", "actualiza el changelog", "qué versión toca" o "notas de la versión".
---

# Changelog y release (Keep a Changelog + SemVer)

## 1. Reúne los cambios
```bash
git describe --tags --abbrev=0          # última etiqueta (p. ej. v1.4.2)
git log v1.4.2..HEAD --oneline --no-merges
```
Si no hay etiquetas, usa todo el historial y pregunta al usuario por la versión inicial.

## 2. Clasifica (Keep a Changelog)
| Sección | Qué va |
|---|---|
| `Added` / Añadido | Funcionalidades nuevas |
| `Changed` / Cambiado | Cambios en funcionalidad existente |
| `Deprecated` / Obsoleto | Lo que se eliminará en el futuro |
| `Removed` / Eliminado | Lo que se eliminó |
| `Fixed` / Corregido | Errores corregidos |
| `Security` / Seguridad | Vulnerabilidades corregidas |

Usa los nombres de sección que ya tenga el `CHANGELOG.md` del proyecto (inglés o español). Con commits convencionales: `feat` → Añadido, `fix` → Corregido, `perf`/`refactor` visibles → Cambiado. `chore`, `ci`, `test`, `docs` internos normalmente **no** van al changelog.

Escribe para quien **usa** el software: "Exportar pedidos a CSV", no "refactor del ExportService".

## 3. Calcula la versión (SemVer MAYOR.MENOR.PARCHE)
- Cambio incompatible (`feat!:`, `BREAKING CHANGE:`, API eliminada) → **MAYOR**.
- Funcionalidad compatible (`feat`) → **MENOR**.
- Solo correcciones → **PARCHE**.
- En `0.y.z` la API se considera inestable: muchos proyectos suben MENOR para cambios incompatibles. Sigue la política del proyecto y explícalo.
Muestra la versión propuesta y el motivo; deja que el usuario confirme.

## 4. Actualiza CHANGELOG.md
- Mueve lo de `## [Unreleased]` a `## [X.Y.Z] - AAAA-MM-DD` (fecha ISO) y deja `[Unreleased]` vacío arriba.
- Más reciente arriba. Incluye los cambios incompatibles con una nota de migración.
- Actualiza los enlaces de comparación al pie si el archivo los usa:
  `[X.Y.Z]: https://github.com/org/repo/compare/vANTERIOR...vX.Y.Z`
- Actualiza la versión en el manifiesto (`package.json`, `pyproject.toml`, `Cargo.toml`…) si el proyecto la guarda ahí.

## 5. Etiqueta (solo si el usuario lo confirma)
```bash
git commit -am "chore(release): vX.Y.Z"
git tag -a vX.Y.Z -m "vX.Y.Z"
```
**No hagas `git push`, ni de commits ni de tags, ni publiques paquetes (`npm publish`, `cargo publish`…) sin permiso explícito.**

## Entrega
Versión propuesta y razón, diff de `CHANGELOG.md` y los comandos pendientes para que el usuario publique.
