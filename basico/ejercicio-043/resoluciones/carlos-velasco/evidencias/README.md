# Ejercicio 043 - Filtros por estado para catalogo de peliculas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_miedo`.
- Se aplicaron restricciones `CHECK` para duración, puntuación y año de estreno.
- Se insertaron 10 películas con estados activos e inactivos.
- Se utilizaron filtros por estado, agregaciones, ordenamiento y `LIMIT`.