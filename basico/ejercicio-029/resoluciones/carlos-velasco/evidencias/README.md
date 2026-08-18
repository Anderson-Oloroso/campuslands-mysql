# Ejercicio 029 - Fechas basicas para marketplace de accesorios

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `productos_accesorios`.
- Se utilizaron `DATE`, `DECIMAL`, `ENUM`, `NOT NULL` y restricciones `CHECK`.
- Se insertaron 10 productos con diferentes fechas y estados.
- Se utilizaron filtros por fecha, `BETWEEN`, `ORDER BY`, `LIMIT` y condiciones combinadas.