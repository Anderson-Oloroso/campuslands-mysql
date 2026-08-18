# Ejercicio 051 - Nivel Básico - WHERE Dibujo Digital

## 1. Temática

Dibujo digital con consultas WHERE para filtrar por técnica, precio y tamaño.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-051-bas-dibujos`.
  - Columnas: `id`, `titulo`, `artista`, `tecnica`, `precio`, `tamanio`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 dibujos con diferentes técnicas y precios.

- **Consultas (DQL):**
  - La consulta `1` filtra dibujos digitales.
  - La consulta `2` filtra dibujos con precio mayor a 200.
  - La consulta `3` filtra dibujos grandes o pequeños con IN.
