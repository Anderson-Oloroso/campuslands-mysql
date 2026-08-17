# Ejercicio 012 - Window Functions para playlist musical

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `artistas` y `canciones`.
- Se utilizaron claves foráneas, `UNIQUE` y restricciones `CHECK`.
- Se insertaron 8 artistas y 12 canciones.
- Las consultas utilizan `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `SUM() OVER()`, `AVG() OVER()` y `LAG()`.
- Se utilizaron `PARTITION BY`, CTE, filtros, ordenamientos y cálculos para generar reportes de la playlist.