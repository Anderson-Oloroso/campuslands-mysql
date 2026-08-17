# Ejercicio 017 - Procedimientos almacenados para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `productos`, `ventas` y `detalle_venta`.
- Se utilizaron claves foráneas, restricciones `CHECK`, `ENUM`, `NOT NULL` y `UNIQUE`.
- Se cargaron 10 productos y 8 ventas con sus detalles.
- Se implementaron 4 procedimientos almacenados para consultas, control de stock, resumen de ventas y registro de ventas.
- Se incluyeron 8 consultas con filtros, ordenamientos, agregaciones, `JOIN`, `HAVING`, subconsulta y ranking.
- El procedimiento de registro de ventas utiliza una transacción para mantener sincronizados la venta, su detalle y el stock.