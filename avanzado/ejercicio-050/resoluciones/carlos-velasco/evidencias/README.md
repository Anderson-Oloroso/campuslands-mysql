# Ejercicio 050 - indices para estudio de tatuajes

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `tatuajes`.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `ENUM` y restricciones `CHECK`.
- Se insertaron 10 registros.
- Se crearon índices para `artista`, `estilo`, `estado`, `fecha_tatuaje` y un índice compuesto para `estado` y `fecha_tatuaje`.
- Se utilizaron consultas de filtros, ordenamientos, agregaciones y `EXPLAIN` para revisar los planes de ejecución.