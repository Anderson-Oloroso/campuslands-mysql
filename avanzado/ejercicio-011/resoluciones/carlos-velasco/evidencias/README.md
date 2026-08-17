# Ejercicio 011 - CTE para pingpong

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

* Se utilizó la base de datos `campuslands_mysql`.
* Se crearon las tablas `jugadores` y `partidos`.
* Se aplicaron claves foráneas y restricciones `CHECK` para validar los datos.
* Se insertaron 8 jugadores y 10 partidos.
* Se utilizaron CTE para rankings, estadísticas, resultados y resúmenes.
* Las consultas incluyen filtros, ordenamientos, agregaciones, `JOIN`, `UNION ALL` y `ROW_NUMBER()`.
