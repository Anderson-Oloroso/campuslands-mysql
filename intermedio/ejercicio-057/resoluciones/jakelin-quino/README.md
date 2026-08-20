# Ejercicio 057 - Nivel Intermedio - Reportes Videojuego Acción y Aventura

## 1. Temática

Videojuego de acción y aventura con consultas de reportes para análisis.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-057-int-personajes`.
  - Columnas: `id`, `nombre`, `tipo`, `nivel`, `vida`, `ataque`, `misiones_completadas`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 personajes con diferentes estadísticas y misiones.

- **Consultas (DQL):**
  - La consulta `1` agrupa por tipo con COUNT y AVG.
  - La consulta `2` muestra top 3 por misiones.
  - La consulta `3` muestra estadísticas generales.
