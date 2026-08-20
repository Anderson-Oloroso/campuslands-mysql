# Ejercicio 054 - Bloqueos para soldadura

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.
4. Para comprobar bloqueos, utilizar dos sesiones MySQL simultáneas.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `ordenes_soldadura` utilizando el motor `InnoDB`.
- Se aplicaron `PRIMARY KEY`, `CHECK`, `NOT NULL` y `ENUM`.
- Se insertaron 10 órdenes de soldadura.
- Se utilizaron transacciones con `START TRANSACTION` y `COMMIT`.
- Se utilizaron bloqueos `FOR UPDATE` y `FOR SHARE`.
- Se realizaron consultas con filtros, ordenamientos y agregaciones.