# Ejercicio 060 - Carga de datos para equipo de streaming

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `equipos_streaming` para representar el inventario de equipos.
- Se utilizaron `PRIMARY KEY`, `NOT NULL`, `CHECK` y `UNIQUE` para validar los datos.
- Se cargaron 10 registros de equipos de streaming.
- Se utilizaron consultas con filtros, ordenamientos, `COUNT`, `SUM` y `LIMIT`.