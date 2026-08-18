# Ejercicio 036 - EXPLAIN para autos hiperdeportivos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `autos_hiperdeportivos` con restricciones para año, potencia, velocidad y precio.
- Se insertaron 10 registros.
- Se crearon índices para marca, estado, precio y potencia.
- Se utilizaron filtros, ordenamientos, agregaciones, `SHOW INDEX` y `EXPLAIN`.