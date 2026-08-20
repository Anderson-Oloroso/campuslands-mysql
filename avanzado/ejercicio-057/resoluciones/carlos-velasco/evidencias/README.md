# Ejercicio 057 - window functions para videojuego de accion y aventura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `jugadores` y `partidas` relacionadas mediante clave foránea.
- Se utilizaron restricciones `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `NOT NULL` y `ENUM`.
- Se insertaron 8 jugadores y 16 partidas.
- Se utilizaron `RANK`, `DENSE_RANK`, `ROW_NUMBER`, `SUM`, `AVG` y `LAG` como window functions.
- Las consultas permiten analizar rankings, acumulados, promedios y evolución de puntuaciones.