# Ejercicio 046 - Nivel Básico - Restaurante Comida Urbana

## 1. Temática

Restaurante de comida urbana con CREATE TABLE para gestionar platos del menú.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-046-bas-platos`.
  - Columnas: `id`, `nombre`, `categoria`, `precio`, `tiempo_prep`, `disponible`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 platos con diferentes categorías y precios.
  - 1 plato no disponible para pruebas.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los platos del menú.
  - La consulta `2` filtra los platos disponibles.
  - La consulta `3` agrupa y cuenta por categoría.
