# Ejercicio 038 - normalizacion 3FN para futbol sala

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `ciudades`, `posiciones`, `equipos_futsal` y `jugadores_futsal`.
- Se aplicó normalización 3FN separando datos de ciudades y posiciones de sus entidades relacionadas.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE`, `CHECK` y `ENUM`.
- Se insertaron 5 ciudades, 4 posiciones, 5 equipos y 13 jugadores.
- Se utilizaron `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `WHERE` y `ORDER BY`.