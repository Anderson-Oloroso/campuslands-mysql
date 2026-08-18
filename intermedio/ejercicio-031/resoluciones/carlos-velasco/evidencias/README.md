# Ejercicio 031 - INNER JOIN para torneo esports MOBA

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `equipos`, `jugadores` y `partidas`.
- Se utilizaron claves foráneas para relacionar jugadores, equipos y partidas.
- Se aplicaron `NOT NULL`, `UNIQUE`, `ENUM` y restricciones `CHECK`.
- Se insertaron 5 equipos, 10 jugadores y 6 partidas.
- Se utilizaron `INNER JOIN`, múltiples joins sobre la misma tabla, `WHERE`, `IN`, `COUNT`, `GROUP BY` y `ORDER BY`.