# Ejercicio 021 - EXPLAIN para dibujo digital

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `artistas`, `obras` y `proyectos`.
- Se utilizaron claves foráneas, `CHECK`, `ENUM` y `NOT NULL`.
- Se cargaron 10 artistas, 12 obras y 10 proyectos.
- Se crearon índices para estados, precios y relaciones de búsqueda.
- Se utilizaron índices compuestos para consultas por artista/fecha y artista/estado.
- Se incluyeron 8 consultas de negocio y 5 análisis mediante `EXPLAIN`.