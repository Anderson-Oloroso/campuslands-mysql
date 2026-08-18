# Ejercicio 055 - backup logico para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Generar el backup lógico con `mysqldump`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas` con `PRIMARY KEY`, `UNIQUE`, `ENUM` y `CHECK`.
- Se insertaron 10 registros coherentes.
- Se utilizaron consultas de filtros, ordenamientos, agregaciones y `LIMIT`.
- El backup lógico se genera mediante `mysqldump`.