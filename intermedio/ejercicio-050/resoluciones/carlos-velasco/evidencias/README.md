# Ejercicio 050 - Subconsultas para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clientes`, `tatuadores` y `citas`.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 16 registros en total.
- Se utilizaron subconsultas escalares, `IN` y `NOT EXISTS`.
- Las consultas comparan precios y tarifas con promedios y buscan relaciones entre clientes y citas.