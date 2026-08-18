# Ejercicio 058 - Nivel Básico - Filtros por Estado Academia Tech

## 1. Temática

Academia tech con filtros por estado para gestionar cursos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-058-bas-cursos`.
  - Columnas: `id`, `nombre`, `nivel`, `duracion`, `estado`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 cursos con diferentes estados.

- **Consultas (DQL):**
  - La consulta `1` filtra cursos activos.
  - La consulta `2` filtra cursos finalizados.
  - La consulta `3` agrupa por estado.
