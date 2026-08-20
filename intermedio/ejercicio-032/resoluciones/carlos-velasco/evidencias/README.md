# Ejercicio 032 - LEFT JOIN para ranking battle royale

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `jugadores` y `partidas`.
- Se utilizó una relación mediante `FOREIGN KEY`.
- Se aplicaron `NOT NULL`, `UNIQUE`, `ENUM` y restricciones `CHECK`.
- Se insertaron 10 jugadores y 10 partidas.
- Se dejaron jugadores sin partidas para demostrar el comportamiento de `LEFT JOIN`.
- Se utilizaron `LEFT JOIN`, `COUNT`, `SUM`, `AVG`, `COALESCE`, `GROUP BY`, `ORDER BY` y `LIMIT`.