# Ejercicio 055 - UNIQUE para laboratorio de formulas quimicas

## Ejecución

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones técnicas

- Se utilizó la base de datos `campuslands_mysql`.
- Se creó la tabla `formulas_quimicas`.
- Se aplicó `UNIQUE` sobre la columna `formula`.
- Se agregó una restricción `CHECK` para evitar cantidades de muestras negativas.
- Se insertaron 8 fórmulas químicas.
- Se utilizaron filtros, `COUNT`, `GROUP BY`, `HAVING` y ordenamientos.