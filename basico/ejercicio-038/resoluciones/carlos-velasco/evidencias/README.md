# Ejercicio 038 - UPDATE para futbol sala

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `jugadores` con información de jugadores de futbol sala.
- Se aplicaron restricciones `PRIMARY KEY` y `CHECK` para validar camisetas, edades, estadísticas y estados.
- Se insertaron 10 registros.
- Se utilizaron `UPDATE` para modificar goles, asistencias y estado de jugadores.
- Se incluyeron consultas con filtros, `ORDER BY`, `LIMIT`, agregaciones y `GROUP BY`.