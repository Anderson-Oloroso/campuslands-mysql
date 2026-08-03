# Ejercicio 012 - Modelado de entidad

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la entidad `playlists` para representar listas de reproducción musicales.
- Se definieron atributos representativos como nombre, propietario, género, cantidad de canciones, duración, privacidad y fecha de creación.
- Se aplicaron restricciones `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con datos realistas para validar consultas.
- Se agregaron consultas para listar información, realizar filtros, ordenamientos y agrupaciones.