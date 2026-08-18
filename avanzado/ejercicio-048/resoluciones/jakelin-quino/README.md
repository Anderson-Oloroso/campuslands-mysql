# Ejercicio 048 - Nivel Avanzado - Funciones SQL Viajes y Turismo

## 1. Temática

Viajes y turismo con funciones SQL para manipular fechas, matemáticas y texto.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-048-adv-reservas`.
  - Columnas: `id`, `cliente`, `destino`, `fecha`, `precio`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 reservas con diferentes fechas y precios.

- **Consultas (DQL):**
  - La consulta `1` usa funciones de fecha (`MONTHNAME`, `YEAR`).
  - La consulta `2` usa funciones matemáticas (`ROUND` para calcular IVA).
  - La consulta `3` usa funciones de texto (`UPPER` para mayúsculas).
