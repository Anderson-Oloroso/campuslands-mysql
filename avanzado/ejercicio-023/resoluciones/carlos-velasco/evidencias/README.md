# Ejercicio 023 - Roles y permisos para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `arquitectos`, `proyectos_arquitectura` y `modelos_3d`.
- Se utilizaron claves foráneas, `CHECK`, `ENUM` y `NOT NULL`.
- Se cargaron 10 arquitectos, 10 proyectos y 12 modelos 3D.
- Se crearon los roles `rol_arquitecto` y `rol_consulta_3d`.
- `rol_arquitecto` posee permisos de consulta e inserción/actualización.
- `rol_consulta_3d` posee permisos de solo lectura.
- Se incluyeron consultas de negocio y comprobaciones mediante `SHOW GRANTS`.