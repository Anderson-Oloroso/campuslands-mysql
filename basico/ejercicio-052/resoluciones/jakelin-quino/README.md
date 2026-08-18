# Ejercicio 052 - Nivel Básico - ORDER BY Animación 3D

## 1. Temática

Animación 3D con ORDER BY para ordenar personajes por diferentes criterios.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-052-bas-personajes`.
  - Columnas: `id`, `nombre`, `pelicula`, `poligonos`, `tiempo_animacion`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 6 personajes de 3 películas diferentes.

- **Consultas (DQL):**
  - La consulta `1` ordena por polígonos de mayor a menor.
  - La consulta `2` ordena por tiempo de animación de mayor a menor.
  - La consulta `3` ordena por película y luego por nombre.
