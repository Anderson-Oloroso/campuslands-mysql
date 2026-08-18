# Ejercicio 039 - DELETE controlado para kickboxing

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `peleadores` con restricciones `PRIMARY KEY` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizó `DELETE` con una condición específica sobre los peleadores retirados.
- Se verificaron los registros antes y después de la eliminación.
- Se incluyeron consultas con filtros, `ORDER BY`, `LIMIT`, `GROUP BY` y funciones de agregación.