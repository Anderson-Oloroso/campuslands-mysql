# Ejercicio 059 - Nivel Básico - Fechas Básicas Marketplace Accesorios

## 1. Temática

Marketplace de accesorios con fechas para gestionar publicaciones y actualizaciones.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-059-bas-productos`.
  - Columnas: `id`, `nombre`, `precio`, `fecha_publicacion`, `fecha_actualizacion`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 productos con fechas de publicación y actualización.

- **Consultas (DQL) - Funciones de fecha:**
  - La consulta `1` usa YEAR() para filtrar por año.
  - La consulta `2` filtra productos actualizados.
  - La consulta `3` usa DATEDIFF() para calcular días entre fechas.
