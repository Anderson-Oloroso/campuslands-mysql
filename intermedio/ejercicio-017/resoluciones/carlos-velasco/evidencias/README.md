# Ejercicio 017 - LEFT JOIN para tienda de ropa

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clientes` y `pedidos` relacionadas mediante una clave foránea.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 8 clientes y 10 pedidos, incluyendo clientes sin pedidos.
- Las consultas utilizan `LEFT JOIN`, `COUNT`, `SUM`, `COALESCE`, `GROUP BY`, `HAVING`, filtros, ordenamientos y `LIMIT`.
- Se priorizó demostrar clientes sin pedidos y reportes agregados por cliente.