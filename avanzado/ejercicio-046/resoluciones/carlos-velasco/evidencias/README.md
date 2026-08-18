# Ejercicio 046 - transacciones para restaurante de comida urbana

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `productos`, `pedidos` y `detalle_pedido`.
- Se utilizaron claves primarias, claves foráneas, `NOT NULL` y restricciones `CHECK`.
- Se insertaron 8 productos, 4 pedidos y 10 detalles de pedido.
- Se utilizaron transacciones con `START TRANSACTION`, `COMMIT` y `ROLLBACK`.
- Se validó el manejo de pedidos, detalles y actualización de stock.