# Ejercicio 051 - Nivel Avanzado - EXPLAIN Dibujo Digital

## 1. Temática

Dibujo digital con EXPLAIN para analizar el rendimiento de consultas.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-051-adv-dibujos`.
  - Columnas: `id`, `titulo`, `artista`, `tecnica`, `precio`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Índices en `artista` y `precio`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 dibujos con diferentes artistas y precios.

- **Consultas (DQL):**
  - La consulta `1` muestra los índices creados.
  - La consulta `2` usa EXPLAIN para analizar consulta con índice `idx_artista`.
  - La consulta `3` usa EXPLAIN para analizar consulta con índice `idx_precio`.
