# Ejercicio 016 - Transacciones para restaurante de comida urbana

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `productos`, `pedidos` y `detalle_pedido`.
- Se utilizaron claves foráneas, restricciones `CHECK`, `ENUM`, `NOT NULL` y una restricción `UNIQUE`.
- Se cargaron 10 productos y 8 pedidos con sus respectivos detalles.
- Se implementaron transacciones con `COMMIT` y `ROLLBACK`.
- Se incluyeron 8 consultas con filtros, ordenamientos, cálculos, `JOIN`, `GROUP BY`, `HAVING`, subconsultas y ranking.