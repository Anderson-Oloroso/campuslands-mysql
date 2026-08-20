# Ejercicio 060 - optimizacion para equipo de streaming

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `equipo_streaming` con 10 registros.
- Se utilizaron restricciones `CHECK`, `UNIQUE`, `NOT NULL` y `ENUM`.
- Se agregaron índices para plataforma/estado, rol, seguidores y fecha de ingreso.
- Se incluyeron consultas de filtrado, agregación, ordenamiento y `EXPLAIN` para analizar los planes de ejecución.