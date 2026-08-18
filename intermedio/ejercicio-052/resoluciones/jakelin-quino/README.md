# Ejercicio 052 - Nivel Intermedio - Normalización 2FN Animación 3D

## 1. Temática

Animación 3D con normalización 2FN separando estudios, proyectos y personajes.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de estudios: `ejercicio-052-int-estudios`.
  - Tabla de proyectos: `ejercicio-052-int-proyectos`.
  - Tabla de personajes: `ejercicio-052-int-personajes`.
  - FOREIGN KEY en `estudio_id` y `proyecto_id`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 estudios, 3 proyectos, 4 personajes.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los estudios.
  - La consulta `2` muestra proyectos con su estudio.
  - La consulta `3` muestra personajes con su proyecto y estudio.
