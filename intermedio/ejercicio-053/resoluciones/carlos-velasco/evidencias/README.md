# Ejercicio 053 - normalizacion 3FN para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clientes`, `arquitectos`, `software_3d`, `tipos_proyecto` y `proyectos`.
- Se aplicó normalización 3FN separando atributos que dependen de entidades independientes.
- Se utilizaron claves primarias, claves foráneas, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se insertaron 8 proyectos y los registros relacionados necesarios.
- Se utilizaron `JOIN`, `GROUP BY`, agregaciones, subconsulta, filtros y `ORDER BY`.