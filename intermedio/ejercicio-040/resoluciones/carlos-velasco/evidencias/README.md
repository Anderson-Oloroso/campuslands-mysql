# Ejercicio 040 - UNIQUE para carreras urbanas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `participantes_carreras`.
- Se aplicó `UNIQUE` al documento para evitar participantes duplicados.
- Se agregaron 10 registros con diferentes categorías, ciudades y estados.
- Se utilizaron filtros, `GROUP BY`, `HAVING`, `MIN`, `ORDER BY` y `LIMIT`.