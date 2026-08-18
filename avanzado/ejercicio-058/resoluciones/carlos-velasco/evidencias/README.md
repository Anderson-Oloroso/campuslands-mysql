# Ejercicio 058 - JSON en MySQL para academia tech

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `estudiantes` con información académica flexible almacenada en una columna `JSON`.
- Se utilizaron `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `ENUM` y `CHECK`.
- Se insertaron 8 registros.
- Se utilizaron operadores JSON, `JSON_CONTAINS`, agregaciones y `RANK()`.
- Las consultas permiten filtrar, ordenar, agrupar y analizar información almacenada dentro del JSON.