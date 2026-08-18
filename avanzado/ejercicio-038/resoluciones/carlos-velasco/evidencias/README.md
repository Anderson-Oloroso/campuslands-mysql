# Ejercicio 038 - roles y permisos para futbol sala

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores` con restricciones `PRIMARY KEY` y `CHECK`.
- Se insertaron 10 registros.
- Se crearon los roles `rol_entrenador` y `rol_analista`.
- El entrenador tiene permisos `SELECT`, `INSERT` y `UPDATE`.
- El analista tiene permiso `SELECT`.
- Se crearon usuarios de prueba y se asignaron los roles correspondientes.
- Se incluyeron consultas de reportes y comprobaciones mediante `SHOW GRANTS`.