# Ejercicio 037 - vistas avanzadas para liga de futbol

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `equipos`, `jugadores` y `partidos`.
- Se utilizaron claves foráneas y restricciones `CHECK` para mantener la integridad de los datos.
- Se insertaron 30 registros: 6 equipos, 12 jugadores y 12 partidos.
- Se crearon las vistas `vw_clasificacion_liga` y `vw_ranking_goleadores`.
- Se utilizaron `JOIN`, agregaciones, `GROUP BY`, `HAVING`, funciones de ventana, filtros y ordenamientos.