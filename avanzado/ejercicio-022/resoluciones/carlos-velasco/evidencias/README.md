# Ejercicio 022 - Vistas avanzadas para animacion 3D

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `artistas_3d`, `proyectos_3d` y `escenas`.
- Se utilizaron claves foráneas, `CHECK`, `ENUM` y `NOT NULL`.
- Se cargaron 10 artistas, 10 proyectos y 12 escenas.
- Se crearon 3 vistas para resumir proyectos, rendimiento de artistas y escenas críticas.
- Se incluyeron 8 consultas utilizando filtros, agregaciones, ranking, `CASE` y `LIMIT`.