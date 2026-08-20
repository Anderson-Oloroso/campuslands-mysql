# Ejercicio 049 - HAVING para paracaidismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `saltos` con restricciones `NOT NULL` y `CHECK`.
- Se insertaron 12 registros de participantes y saltos.
- Se utilizaron `GROUP BY`, `HAVING`, `COUNT`, `SUM`, `AVG` y `ROUND`.
- Las consultas filtran grupos según cantidad, costos y alturas promedio.