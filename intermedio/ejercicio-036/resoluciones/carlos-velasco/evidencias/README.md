# Ejercicio 036 - normalizacion 1FN para autos hiperdeportivos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `autos_hiperdeportivos` con atributos atómicos para cumplir 1FN.
- Se utilizaron `PRIMARY KEY`, `NOT NULL` y restricciones `CHECK`.
- Se insertaron 10 registros coherentes.
- Se utilizaron filtros, ordenamientos, agregaciones, `GROUP BY` y subconsultas.