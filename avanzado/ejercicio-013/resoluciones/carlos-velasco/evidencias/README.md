# Ejercicio 013 - JSON en MySQL para catalogo de peliculas de miedo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas` con información variable almacenada en un campo `JSON`.
- Se aplicaron `UNIQUE` y restricciones `CHECK`.
- Se insertaron 8 películas con datos de directores, países, actores, etiquetas, puntuaciones y premios.
- Las consultas utilizan extracción JSON, filtros sobre arrays, conteo de elementos, `JSON_TABLE`, agregaciones y ordenamientos.