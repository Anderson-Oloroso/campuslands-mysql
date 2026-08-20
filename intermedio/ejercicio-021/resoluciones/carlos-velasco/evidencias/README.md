# Ejercicio 021 - Normalización 1FN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `dibujos_digitales` con atributos atómicos para aplicar 1FN.
- Se utilizaron restricciones `NOT NULL`, `ENUM` y `CHECK` para validar los datos.
- Se insertaron 10 registros coherentes.
- Se incluyeron consultas con `WHERE`, `ORDER BY`, `GROUP BY`, `AVG`, `COUNT`, `SUM` y `LIMIT`.