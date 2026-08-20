# Ejercicio 035 - subconsultas para taller mecanico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `motos` y `servicios`.
- Se utilizó una `FOREIGN KEY` para relacionar los servicios con las motos.
- Se insertaron 10 motos y 15 servicios.
- Se utilizaron subconsultas escalares, `IN`, `NOT IN`, `AVG`, `MAX`, `SUM` y consultas correlacionadas.