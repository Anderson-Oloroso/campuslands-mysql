# Ejercicio 035 - indices para taller mecanico de motos

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `servicios_mecanicos` con validaciones para costos y fechas.
- Se insertaron 10 registros.
- Se crearon índices para `placa`, `estado` y `fecha_ingreso`.
- Se utilizaron filtros, ordenamientos, agregaciones, `SHOW INDEX` y `EXPLAIN` para comprobar la estructura y analizar las consultas.