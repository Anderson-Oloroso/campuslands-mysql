# Ejercicio 023 - Normalizacion 3FN para arquitectura 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `arquitectos`, `tipos_proyecto`, `softwares_3d`, `estados_proyecto` y `proyectos_arquitectura_3d`.
- Se separaron los datos descriptivos mediante claves foráneas para evitar dependencias transitivas y aplicar 3FN.
- Se utilizaron `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL` y `CHECK`.
- Se registraron 10 proyectos, 6 arquitectos, 5 tipos, 4 softwares y 4 estados.
- Se utilizaron `JOIN`, `GROUP BY`, `HAVING`, `AVG`, `SUM`, `COUNT`, filtros y `LIMIT`.