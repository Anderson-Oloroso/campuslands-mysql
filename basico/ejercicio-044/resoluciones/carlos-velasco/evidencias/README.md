# Ejercicio 044 - Fechas básicas para saga de ciencia ficción

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas_ciencia_ficcion`.
- Se utilizó `DATE` para almacenar las fechas de estreno.
- Se aplicaron restricciones `NOT NULL`, `UNIQUE` y `CHECK`.
- Se insertaron 8 registros.
- Se utilizaron filtros por fecha, `MONTH`, `BETWEEN`, `ORDER BY` y `LIMIT`.