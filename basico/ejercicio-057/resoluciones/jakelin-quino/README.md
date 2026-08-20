# Ejercicio 057 - Nivel Básico - Modelado de Entidad Videojuego Acción y Aventura

## 1. Temática

Videojuego de acción y aventura con modelado de entidad para personajes.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-057-bas-personajes`.
  - Columnas: `id`, `nombre`, `tipo`, `nivel`, `vida`, `ataque`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 personajes con diferentes roles y estadísticas.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los personajes.
  - La consulta `2` agrupa por tipo.
  - La consulta `3` filtra por nivel mayor a 15.
