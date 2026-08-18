# Ejercicio 057 - Nivel Avanzado - Window Functions Videojuego Acción y Aventura

## 1. Temática

Videojuego de acción y aventura con window functions para análisis avanzado.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-057-adv-personajes`.
  - Columnas: `id`, `nombre`, `tipo`, `nivel`, `ataque`, `misiones`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 personajes con diferentes tipos y estadísticas.

- **Consultas (DQL):**
  - La consulta `1` usa ROW_NUMBER para ranking general.
  - La consulta `2` usa PARTITION BY para ranking por tipo.
  - La consulta `3` usa AVG OVER para comparar con promedio.
