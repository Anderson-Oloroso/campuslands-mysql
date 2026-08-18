# Ejercicio 059 - fechas basicas para marketplace de accesorios

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `accesorios` con información básica del marketplace.
- Se utilizaron campos `DATE` para publicación y actualización.
- Se aplicaron restricciones para validar precios y fechas coherentes.
- Se insertaron 10 registros con diferentes fechas y estados.
- Se utilizaron filtros por fecha, `BETWEEN`, ordenamientos y `DATEDIFF()`.