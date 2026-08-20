# Ejercicio 030 - Relaciones simples para equipo de streaming

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `streamers` y `equipos_streaming`.
- Se estableció una relación mediante `FOREIGN KEY`.
- Se utilizaron `NOT NULL`, `UNIQUE`, `ENUM` y `CHECK`.
- Se insertaron 5 streamers y 10 equipos.
- Se utilizaron `INNER JOIN`, `LEFT JOIN`, `WHERE`, `COUNT`, `SUM`, `GROUP BY` y `ORDER BY`.