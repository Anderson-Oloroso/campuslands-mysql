# Ejercicio 052 - vistas avanzadas para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `proyectos`, `animadores` y `participaciones`.
- Se crearon las vistas `vw_participaciones_animacion` y `vw_resumen_proyectos`.
- Se aplicaron `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `NOT NULL` y `ENUM`.
- Se insertaron 8 proyectos, 8 animadores y 16 participaciones.
- Se utilizaron `JOIN`, agregaciones, `GROUP BY`, `HAVING`, filtros, ordenamientos y `LIMIT` mediante las vistas.