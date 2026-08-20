# Ejercicio 047 - LEFT JOIN para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clientes`, `productos`, `pedidos` y `detalle_pedido`.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `ENUM` y `CHECK`.
- Se insertaron 10 clientes, 10 productos, 8 pedidos y 13 detalles.
- Se utilizaron `LEFT JOIN`, `IS NULL`, `COALESCE`, `GROUP BY`, `SUM`, `COUNT`, `WHERE` y `ORDER BY`.
- Se incluyeron clientes y productos sin pedidos o ventas para comprobar correctamente el comportamiento de `LEFT JOIN`.