# Ejercicio 024 - DELETE controlado para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura`.
- Se utilizaron `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 10 registros con diferentes estados.
- Se utilizó `DELETE` con una condición específica sobre registros cancelados.
- Se incluyó una consulta previa y otra posterior para verificar el borrado controlado.
- También se utilizaron `WHERE`, `IN`, `ORDER BY`, `GROUP BY`, `COUNT` y `SUM`.