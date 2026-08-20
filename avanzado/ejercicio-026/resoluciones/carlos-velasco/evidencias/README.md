# Ejercicio 026 - CTE para videojuego RPG

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se crearon las tablas `clases`, `personajes`, `misiones` y `personajes_misiones`.
- Se utilizaron claves foráneas, `UNIQUE`, `CHECK`, `NOT NULL` y `ENUM`.
- Se insertaron 8 clases, 12 personajes, 10 misiones y 34 participaciones.
- Se incluyeron 8 consultas con CTE para agregaciones, filtros, rankings y estadísticas.
- Se utilizaron `WITH`, `CROSS JOIN`, funciones de agregación y funciones de ventana.