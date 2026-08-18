# Ejercicio 059 - vistas simples para marketplace de accesorios

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `accesorios` y la vista `vista_accesorios_activos`.
- Se aplicó una restricción `CHECK` para evitar precios no válidos.
- Se insertaron 10 registros, incluyendo estados activos e inactivos.
- Se utilizaron filtros, `GROUP BY`, `COUNT`, `AVG`, `ORDER BY` y `LIMIT` sobre la vista.