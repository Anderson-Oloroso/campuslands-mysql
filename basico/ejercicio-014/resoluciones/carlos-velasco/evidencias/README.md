# Ejercicio 014 - Fechas básicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la entidad `peliculas_ciencia_ficcion` para almacenar información de una saga y catálogo de películas de ciencia ficción.
- Se utilizaron los tipos de datos `DATE` para fechas de estreno y `DATETIME` para registrar la fecha completa de ingreso.
- Se aplicaron restricciones `PRIMARY KEY`, `NOT NULL`, `DEFAULT`, `ENUM` y `CHECK`.
- Se insertaron ocho registros con diferentes fechas para practicar filtros y ordenamientos temporales.
- Se agregaron consultas para comparar fechas, filtrar registros y realizar agrupaciones.