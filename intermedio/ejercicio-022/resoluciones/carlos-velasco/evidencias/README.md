# Ejercicio 022 - Normalizacion 2FN para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `animadores`, `proyectos_animacion` y `asignaciones_animacion`.
- La relación utiliza una clave primaria compuesta para aplicar 2FN.
- Se utilizaron `FOREIGN KEY`, `NOT NULL`, `ENUM` y `CHECK`.
- Se registraron 6 animadores, 8 proyectos y 14 asignaciones.
- Se utilizaron `JOIN`, `GROUP BY`, `HAVING`, filtros y ordenamientos.