# Ejercicio 018 - PRIMARY KEY para viajes y turismo

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `destinos`.
- `id_destino` se definió como `PRIMARY KEY` con `AUTO_INCREMENT`.
- Se utilizaron `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 10 destinos.
- Las consultas utilizan filtros, ordenamientos, cálculos, `GROUP BY`, agregaciones y `LIMIT`.