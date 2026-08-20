# Ejercicio 058 - Filtros por estado para academia tech

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `cursos` con información de cursos de una academia tech.
- El campo `estado` utiliza los valores `activo`, `inactivo` y `pendiente`.
- Se agregó una restricción `CHECK` para evitar precios negativos.
- Se insertaron 8 registros distribuidos entre los diferentes estados.
- Se utilizaron filtros `WHERE`, ordenamientos, `GROUP BY`, `COUNT` y una subconsulta con `AVG`.