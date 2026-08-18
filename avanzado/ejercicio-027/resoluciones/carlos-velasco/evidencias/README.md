# Ejercicio 027 - Window Functions para videojuego de acción y aventura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `personajes`, `jugadores` y `partidas`.
- Se utilizaron claves foráneas, `UNIQUE`, `CHECK`, `NOT NULL` y `ENUM`.
- Se insertaron 10 personajes, 10 jugadores y 30 partidas.
- Se incluyeron 8 consultas con Window Functions.
- Se utilizaron `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `SUM() OVER()` y `AVG() OVER()`.