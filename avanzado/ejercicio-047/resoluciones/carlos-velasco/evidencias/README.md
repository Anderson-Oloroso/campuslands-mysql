# Ejercicio 047 - procedimientos almacenados para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `productos_ropa`.
- Se utilizaron restricciones `PRIMARY KEY`, `NOT NULL`, `AUTO_INCREMENT` y `CHECK`.
- Se insertaron 10 registros.
- Se implementaron los procedimientos `sp_productos_por_categoria` y `sp_actualizar_stock`.
- Se utilizaron `CALL`, filtros, ordenamientos, `COUNT`, `AVG` y `SUM`.
- `sp_actualizar_stock` valida que el stock no sea negativo.