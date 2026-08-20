# Ejercicio 013 - Filtros por estado

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la entidad `peliculas` para administrar un catálogo de películas de miedo.
- Se agregó el campo `estado` utilizando `ENUM` para controlar la disponibilidad de cada película.
- Se aplicaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con diferentes estados para probar filtros.
- Se agregaron consultas para validar disponibilidad, alquileres, agrupaciones y ordenamientos.