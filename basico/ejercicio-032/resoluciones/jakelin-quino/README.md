# Ejercicio 032 - Nivel Básico - Ranking Battle Royale

## 1. Temática

Ranking de jugadores de Battle Royale usando diferentes tipos de datos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Uso de nombres de tabla con comillas invertidas o guiones bajos para garantizar compatibilidad sintáctica en MySQL.
  - 8 columnas con tipos variados:
    - `VARCHAR(30)` para nick
    - `TINYINT` para nivel (ahorra espacio)
    - `DECIMAL(10,2)` para puntaje (precisión)
    - `INT` para victorias
    - `TIME` para tiempo de juego
    - `DATE` para fecha de registro
    - `BOOLEAN` para estado activo
    - `DECIMAL(5,2)` para tasa de victorias
  - Nombres cortos pero claros.

- **Inserción de Datos (DML):**
  - 9 jugadores variados (pros y casuales).
  - Datos realistas para pruebas.

- **Consultas (DQL):**
  - Top 3 con LIMIT.
  - Filtros con condiciones compuestas.
  - Estadísticas con AVG, SUM, COUNT.
  - Ordenamiento y filtros por fecha.
