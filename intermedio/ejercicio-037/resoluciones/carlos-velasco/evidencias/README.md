# Ejercicio 037 - normalizacion 2FN para liga de futbol

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `equipos`, `jugadores`, `partidos` y `estadisticas_partido`.
- Se utilizó una clave primaria compuesta `(partido_id, jugador_id)` para las estadísticas.
- Se aplicaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 4 equipos, 8 jugadores, 6 partidos y 28 registros de estadísticas.
- Se utilizaron `JOIN`, `GROUP BY`, `HAVING`, agregaciones y ordenamientos.