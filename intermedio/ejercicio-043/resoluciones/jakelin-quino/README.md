# Ejercicio 043 - Nivel Intermedio - Tablas Puente Catálogo Películas de Miedo

## 1. Temática

Catálogo de películas de miedo con tablas puente para relaciones muchos a muchos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - `ejercicio-043-int-peliculas`: Datos de películas.
  - `ejercicio-043-int-categorias`: Catálogo de categorías.
  - `ejercicio-043-int_pelicula_categoria`: Tabla puente con FOREIGN KEY.
  - Uso de comillas invertidas para nombres con guiones.

- **Relación Muchos a Muchos:**
  - Una película puede tener muchas categorías.
  - Una categoría puede pertenecer a muchas películas.
  - Tabla puente con dos llaves foráneas.

- **Inserción de Datos (DML):**
  - 5 películas.
  - 4 categorías (terror, slasher, sobrenatural, clásico).
  - 8 relaciones en tabla puente.

- **Consultas (DQL):**
  - Ver todas las películas y categorías.
  - Películas con sus categorías (JOIN simple).
  - Categorías agrupadas por película con GROUP_CONCAT.
  - Filtrar películas por categoría específica.

- **Ventajas:**
  - Permite múltiples categorías por película.
  - Flexible y escalable.
  - Mantiene integridad referencial.
