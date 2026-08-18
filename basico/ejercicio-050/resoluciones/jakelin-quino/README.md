# Ejercicio 050 - Nivel Básico - SELECT Estudio de Tatuajes

## 1. Temática

Estudio de tatuajes con consultas SELECT básicas para gestionar trabajos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-050-bas-tatuajes`.
  - Columnas: `id`, `cliente`, `diseno`, `precio`, `artista`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 tatuajes con diferentes diseños y precios.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los tatuajes.
  - La consulta `2` filtra tatuajes del artista Luis.
  - La consulta `3` filtra tatuajes con precio mayor a 200.
