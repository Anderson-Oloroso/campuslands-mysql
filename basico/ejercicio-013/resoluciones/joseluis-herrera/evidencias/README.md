# Ejercicio 013 - Filtros por estado para catálogo de películas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_miedo`.
- Se aplicó `ENUM` para el campo `estado` y validación del `puntaje`.
- Se insertaron 10 registros realistas.
- Se desarrollaron 5 consultas con filtros, agrupaciones, ordenamientos y ranking.