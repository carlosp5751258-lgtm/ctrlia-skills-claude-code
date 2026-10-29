---
name: tdd
description: Desarrolla una funcionalidad o corrige un bug con TDD estricto (rojo, verde, refactor) en ciclos pequeños, usando el framework de tests del proyecto. Úsala cuando el usuario pida "hazlo con TDD", "test primero", "red-green-refactor" o quiera implementar lógica con reglas de negocio claras.
---

# TDD: rojo → verde → refactor

## Antes de empezar
1. Detecta el framework y el comando para ejecutar **un solo** test (mira `CLAUDE.md`, `package.json`, `pyproject.toml`, `Makefile`, tests vecinos).
2. Ejecuta la suite actual. Si ya hay tests en rojo, avisa al usuario antes de seguir: no se puede hacer TDD sobre una base rota.
3. Escribe una **lista de casos** (comportamientos observables, no detalles internos), de lo más simple a lo más complejo. Muéstrala al usuario en 3–8 viñetas.

## El ciclo (repite por cada caso de la lista)

### 🔴 Rojo
- Escribe **un** test para el siguiente caso. Nombre que describa el comportamiento ("rechaza cupones caducados").
- Ejecútalo y **comprueba que falla por el motivo correcto** (aserción no cumplida), no por un error de importación o sintaxis.
- Si pasa sin cambiar código: el caso ya estaba cubierto o el test no prueba nada. Revísalo.

### 🟢 Verde
- Escribe el código **mínimo** para que ese test pase. Está permitido ser ingenuo.
- Ejecuta el test y luego la suite completa del módulo. Todo debe estar en verde.
- No añadas comportamiento que ningún test exige.

### 🔵 Refactor
- Con todo en verde, elimina duplicación, mejora nombres y extrae funciones, en código **y** tests.
- Ejecuta los tests tras cada cambio. Si algo se pone rojo, deshaz el último paso.
- No cambies comportamiento en esta fase.

## Reglas
- Un ciclo = un comportamiento. Ciclos de minutos, no de horas.
- Nunca modifiques un test para que pase sin decírselo al usuario y explicar por qué el test estaba mal.
- Mockea solo los bordes (red, disco, reloj, aleatoriedad). La lógica de dominio se prueba real.
- Para bugs: primero un test que reproduzca el bug (rojo), luego el arreglo.

## Al terminar
Resume: casos cubiertos, casos descartados o pendientes (y por qué), y el comando para ejecutar los tests añadidos.
