# Ejercicio 044 - vistas simples para saga de ciencia ficcion

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peliculas` con datos de sagas de ciencia ficción.
- Se aplicaron restricciones `NOT NULL`, `CHECK`, `UNSIGNED` y `ENUM`.
- Se insertaron 10 registros.
- Se creó la vista simple `vw_peliculas_ciencia_ficcion` para mostrar películas activas.
- Se utilizaron consultas con filtros, `ORDER BY`, `GROUP BY`, `COUNT`, `AVG` y `LIMIT`.