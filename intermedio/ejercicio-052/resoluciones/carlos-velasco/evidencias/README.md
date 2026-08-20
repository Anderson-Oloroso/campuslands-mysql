# Ejercicio 052 - normalizacion 2FN para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon `proyectos_animacion`, `animadores` y `proyecto_animador`.
- Se utilizó una clave primaria compuesta en `proyecto_animador` para representar la relación entre proyectos y animadores.
- Se aplicaron claves foráneas, restricciones `CHECK` y valores `ENUM`.
- Se insertaron 22 registros: 4 proyectos, 6 animadores y 12 participaciones.
- Las consultas utilizan `JOIN`, `GROUP BY`, `HAVING`, filtros y funciones de agregación.