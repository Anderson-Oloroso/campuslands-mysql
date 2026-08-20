# Ejercicio 046 - Nivel Intermedio - INNER JOIN Restaurante Comida Urbana

## 1. Temática

Restaurante de comida urbana con INNER JOIN para relacionar platos y categorías.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de categorías: `ejercicio-046-int-categorias`.
  - Tabla de platos: `ejercicio-046-int-platos`.
  - FOREIGN KEY en `categoria_id` → `categorias(id)`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 categorías.
  - 4 platos con categorías asignadas.

- **Consultas (DQL):**
  - La consulta `1` muestra todas las categorías.
  - La consulta `2` muestra todos los platos.
  - La consulta `3` usa INNER JOIN para mostrar platos con su categoría.
