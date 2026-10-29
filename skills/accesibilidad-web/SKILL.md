---
name: accesibilidad-web
description: Revisa y corrige la accesibilidad de páginas y componentes web según WCAG 2.2 nivel AA (semántica, teclado, foco, contraste, formularios, ARIA, imágenes, movimiento). Úsala cuando el usuario pida revisar accesibilidad, a11y, WCAG, lectores de pantalla, o al crear componentes interactivos como modales, menús, pestañas o formularios.
---

# Accesibilidad web (WCAG 2.2 AA)

## 1. Herramientas automáticas (detectan ~30–40 % de los problemas)
Usa las que existan en el proyecto o propón instalarlas:
- `npx @axe-core/cli <url>` o `@axe-core/playwright` en tests e2e.
- Lighthouse (categoría Accessibility).
- `eslint-plugin-jsx-a11y` (React) o `eslint-plugin-vuejs-accessibility` (Vue).
El resto requiere revisión manual con la checklist.

## 2. Checklist manual
### Estructura y semántica
- [ ] Un solo `<h1>` y jerarquía de encabezados sin saltos (h2 → h3, no h2 → h4).
- [ ] Landmarks: `<header>`, `<nav>`, `<main>`, `<footer>`.
- [ ] Botones son `<button>` y enlaces son `<a href>`. Nada de `<div onClick>`.
- [ ] `<html lang="es">` (o el idioma correcto).

### Teclado y foco
- [ ] Todo lo interactivo se alcanza con Tab y se activa con Enter/Espacio.
- [ ] Orden de foco lógico; sin `tabindex` positivo.
- [ ] Foco visible (no `outline: none` sin alternativa) y no tapado por cabeceras fijas.
- [ ] Modales: foco al abrir, atrapado dentro, Esc cierra, foco vuelve al disparador.
- [ ] Enlace "Saltar al contenido" en sitios con navegación larga.

### Contenido no textual y color
- [ ] Imágenes informativas con `alt` descriptivo; decorativas con `alt=""`.
- [ ] Iconos-botón con nombre accesible (`aria-label` o texto oculto visualmente).
- [ ] Contraste ≥ 4.5:1 en texto normal, ≥ 3:1 en texto grande y en componentes de interfaz/bordes de foco.
- [ ] La información no depende solo del color (errores con texto, no solo borde rojo).

### Formularios
- [ ] Cada campo con `<label for>` (el placeholder no es una etiqueta).
- [ ] Errores asociados con `aria-describedby` y anunciados (`aria-live="polite"` o `role="alert"`).
- [ ] `autocomplete` en datos personales (`email`, `name`, `tel`…).
- [ ] Objetivos táctiles de al menos 24×24 px CSS (WCAG 2.2, 2.5.8).

### Movimiento y tiempo
- [ ] Respeta `prefers-reduced-motion`.
- [ ] Nada parpadea más de 3 veces por segundo; carruseles con pausa.

## 3. ARIA con criterio
- Primera regla de ARIA: si existe un elemento HTML nativo, úsalo.
- Para widgets personalizados (pestañas, combobox, menú) sigue los patrones del ARIA Authoring Practices Guide (APG): roles, estados (`aria-expanded`, `aria-selected`) y teclado completos.
- Un ARIA incorrecto es peor que ninguno.

## 4. Informe
Para cada problema: criterio WCAG (p. ej. `1.4.3 Contraste`), ubicación, impacto para el usuario y corrección con código. Ordena por impacto: bloqueantes (no se puede completar la tarea) primero.

Recuerda al usuario que la prueba definitiva es usar la página solo con teclado y con un lector de pantalla (NVDA, VoiceOver, TalkBack).
