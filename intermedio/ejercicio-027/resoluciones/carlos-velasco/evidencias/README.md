# Ejercicio 027 - consultas de reportes para videojuego de accion y aventura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `personajes_aventura`.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `UNSIGNED`, `ENUM` y `CHECK`.
- Se insertaron 10 personajes.
- Las consultas generan reportes mediante filtros, ordenamientos, `LIMIT`, agregaciones, `GROUP BY` y cálculos.