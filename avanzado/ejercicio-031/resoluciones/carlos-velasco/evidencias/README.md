# Ejercicio 031 - Transacciones para torneo esports MOBA

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `partidas_moba` con 10 registros.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM`, `CHECK` e índices.
- Se utilizaron consultas de filtros, agregaciones, ranking y análisis de duración.
- Se implementaron transacciones con `COMMIT` y `ROLLBACK` para demostrar confirmación y reversión de cambios.