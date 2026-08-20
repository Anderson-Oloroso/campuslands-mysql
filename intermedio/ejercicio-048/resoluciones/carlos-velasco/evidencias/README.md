# Ejercicio 048 - GROUP BY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `viajes` con restricciones `NOT NULL` y `CHECK`.
- Se insertaron 10 registros de viajes turísticos.
- Se utilizaron `GROUP BY`, `COUNT`, `SUM`, `AVG`, `ROUND` y `HAVING`.
- Las consultas permiten analizar cantidades, costos y duración por grupos.