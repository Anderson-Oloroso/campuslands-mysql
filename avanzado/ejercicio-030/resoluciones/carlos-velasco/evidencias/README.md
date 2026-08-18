# Ejercicio 030 - Optimizacion para equipo de streaming

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `transmisiones` con 10 registros.
- Se aplicaron `PRIMARY KEY`, `NOT NULL`, `ENUM`, `CHECK` e índices.
- Se utilizaron índices sobre plataforma, categoría, fecha, estado y un índice compuesto para categoría y espectadores.
- Se incluyeron consultas de filtros, ordenamientos, agregaciones, ranking y `EXPLAIN`.