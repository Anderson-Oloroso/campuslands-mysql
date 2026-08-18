# Ejercicio 044 - Nivel Básico - Fechas Básicas Saga Ciencia Ficción

## 1. Temática

Saga de ciencia ficción con diferentes tipos de fechas para gestión de lanzamientos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-044-bas-peliculas`.
  - Columnas: `id`, `titulo`, `director`, `fecha_estreno`, `fecha_remasterizacion`, `año_lanzamiento`, `duracion`, `fecha_creacion`.
  - Uso de comillas invertidas para nombres con guiones.

- **Tipos de fecha usados:**
  - **DATE:** Fecha completa (YYYY-MM-DD).
  - **YEAR:** Solo año (YYYY).
  - **TIMESTAMP:** Fecha y hora automática.

- **Inserción de Datos (DML):**
  - 9 películas de Star Wars.
  - Fechas de estreno originales.
  - Una película con fecha de remasterización.

- **Funciones de fecha usadas:**
  - `YEAR()`: Extraer año.
  - `MONTH()`: Extraer mes.
  - `MONTHNAME()`: Nombre del mes.
  - `DATEDIFF()`: Días entre fechas.
  - `TIMESTAMPDIFF()`: Diferencia en años.
  - `CONCAT()` y `FLOOR()` para décadas.

- **Consultas (DQL):**
  - Ordenar por fecha.
  - Filtrar por mes (diciembre).
  - Agrupar por décadas.
  - Calcular diferencias entre fechas.
