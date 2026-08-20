# Ejercicio 060 - Nivel Básico - Relaciones Simples Equipo de Streaming

## 1. Temática

Equipo de streaming con relaciones simples entre streamers y equipos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de streamers: `ejercicio-060-bas-streamers`.
  - Tabla de equipos: `ejercicio-060-bas-equipos`.
  - FOREIGN KEY en `streamer_id` → `streamers(id)`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 streamers con diferentes plataformas.
  - 3 equipos relacionados.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los streamers.
  - La consulta `2` usa INNER JOIN para mostrar equipos con streamers.
  - La consulta `3` filtra streamers con más de 12000 seguidores.
