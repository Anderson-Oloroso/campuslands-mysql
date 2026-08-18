# Ejercicio 055 - Nivel Básico - COUNT y SUM Laboratorio Fórmulas Químicas

## 1. Temática

Laboratorio de fórmulas químicas con COUNT y SUM para análisis de compuestos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-055-bas-compuestos`.
  - Columnas: `id`, `nombre`, `tipo`, `peso`, `cantidad`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 compuestos de diferentes tipos.

- **Consultas (DQL):**
  - La consulta `1` cuenta el total de compuestos.
  - La consulta `2` suma la cantidad total.
  - La consulta `3` agrupa por tipo con COUNT y SUM.
