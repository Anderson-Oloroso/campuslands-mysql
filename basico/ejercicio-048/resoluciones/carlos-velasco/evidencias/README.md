# Ejercicio 048 - PRIMARY KEY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `destinos_turisticos`.
- `id_destino` se definió como `PRIMARY KEY` y `AUTO_INCREMENT`.
- Se agregaron restricciones `NOT NULL` y `CHECK`.
- Se insertaron 10 registros.
- Se utilizaron filtros, ordenamientos, `COUNT`, `AVG` y `LIMIT`.