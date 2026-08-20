# Ejercicio 054 - DELETE controlado para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `trabajos_soldadura` con 8 registros.
- Se aplicó `PRIMARY KEY`, `NOT NULL`, `ENUM` y `CHECK` para validar el costo.
- Se utilizaron filtros, ordenamientos, agrupaciones y agregaciones.
- Se implementó un `DELETE` controlado mediante el identificador del trabajo y su estado.
- Se agregó una consulta posterior para verificar la eliminación.